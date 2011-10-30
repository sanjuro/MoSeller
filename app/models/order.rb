class Order < ActiveRecord::Base
  
  attr_accessible :order_items, :bill_address_attributes, :payments_attributes,
                  :order_items_attributes, :use_billing, :special_instructions,
                  :item_total, :customer_total, :full_total,
                  :email, :customer_name, :mobile_number, :completed_at, :updated_at
                 
  belongs_to :client, :foreign_key => "client_id", :class_name => "Client"
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :bill_address, :foreign_key => "bill_address_id", :class_name => "Address"
  
  has_one :invoice

  has_many :state_events, :as => :stateful
  has_many :order_items, :dependent => :destroy
  # has_many :payments, :dependent => :destroy
  # has_many :packages, :dependent => :destroy

  accepts_nested_attributes_for :order_items
  # accepts_nested_attributes_for :payments
  
  # before_create :create_client
  before_create :generate_order_number  
  
  scope :unpaid, lambda {|user_id| where("order.completed_at IS NOT NULL AND state != 'paid' AND order.user_id = ?", user_id)}
  scope :by_number, lambda {|number| where("order.number = ?", number)}
  scope :recent, order("order.created_at")
  scope :between, lambda {|*dates| where("order.created_at between ? and ?", dates.first.to_date, dates.last.to_date)}
  scope :by_customer, lambda {|customer| joins(:clients).where("clients.email =?", customer)}
  scope :by_user_id, lambda {|user_id| where("order.user_id =?", user_id)}
  scope :complete, where("order.completed_at IS NOT NULL")
  scope :incomplete, where("order.completed_at IS NULL")
  
  # make_permalink :field => :number  
  
  class_attribute :update_hooks
  self.update_hooks = Set.new

  # Use this method in other gems that wish to register their own custom logic that should be called after Order#updat
  def self.register_update_hook(hook)
    self.update_hooks.add(hook)
  end
  
  def completed?
    # !! completed_at
  end

  # Indicates whether or not the user is allowed to proceed to checkout. Currently this is implemented as a
  # check for whether or not there is at least one LineItem in the Order. Feel free to override this logic
  # in your own application if you require additional steps before allowing a checkout.
  def checkout_allowed?
    order_items.count > 0
  end

  # Is this a free order in which case the payment step should be skipped
  def payment_required?
    full_total.to_f > 0.0
  end

  # Indicates the number of items in the order
  def item_count
    order_items.map(&:quantity).sum
  end  
  
  # order state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'cart', :use_transactions => false do
  
    event :next do
      transition :from => 'cart',     :to => 'delivery'
      transition :from => 'delivery', :to => 'confirm'
      transition :from => 'confirm',  :to => 'complete'


      # note: some payment methods will not support a confirm step
      # transition :from => 'payment', :to => 'confirm',
      #                                :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

      # transition :from => 'payment', :to => 'complete'
    end

    event :cancel do
      transition :to => 'canceled', :if => :allow_cancel?
    end
    event :return do
      transition :to => 'returned', :from => 'awaiting_return'
    end
    event :resume do
      transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
    end   

    before_transition :to => 'complete' do |order|
      # order.process_payments! # process payments
      order.process_order_items! # fetch products
    end

    after_transition :to => 'complete' do |order|
      # do account and product stuff here   
      order.finalize! 
      
      # do billing for order this needs to be dynamic as the system might not have MoAccount
      order.billing!
    end
    
    # after_transition :to => 'delivery', :do => :create_tax_charge!
    # after_transition :to => 'payment', :do => :create_shipment!

  end 
  
  # This is a multi-purpose method for processing logic related to changes in the Order. It is meant to be called from
  # various observers so that the Order is aware of changes that affect totals and other values stored in the Order.
  # This method should never do anything to the Order that results in a save call on the object (otherwise you will end
  # up in an infinite recursion as the associations try to save and then in turn try to call +update!+ again.)
  def update!
    update_totals
    # update_payment_state
    # update_adjustments
    # update totals a second time in case updated adjustments have an effect on the total
    # update_totals
    
    update_attributes_without_callbacks({
      :item_total => item_total,
      :customer_total => customer_total,
      :full_total => full_total
    })    

    update_hooks.each { |hook| self.send hook }
  end 
  
  def allow_cancel?
    return false unless completed? and state != 'canceled'
    %w{ready backorder pending}.include? shipment_state
  end

  def allow_resume?
    # we shouldn't allow resume for legacy orders b/c we lack the information necessary to restore to a previous state
    return false if state_events.empty? || state_events.last.previous_state.nil?
    true
  end  
  
  def add_variant(variant, quantity = 1)
    current_item = contains?(variant)
    if current_item
      current_item.quantity += quantity
      current_item.save
    else
      current_item = OrderItem.new(:quantity => quantity)
      current_item.variant = variant
      current_item.customer_price = variant.customer_price
      current_item.billing_price = variant.customer_price
      self.order_items << current_item
    end

    current_item
  end
  
  def generate_order_number
    record = true
    while record
      random = "R#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["number = ?", random])
    end
    self.number = random if self.number.blank?
    self.number
  end
  
  def contains?(variant)
    order_items.detect{|order_item| order_item.variant_id == variant.id}
  end
  
  def creditcards
    creditcard_ids = payments.from_creditcard.map(&:source_id).uniq
    Creditcard.scoped(:conditions => {:id => creditcard_ids})
  end

  def process_payments!
    ret = payments.each(&:process!)
  end
  
  def process_order_items!
    # ret = order_items.each(&:process!)
    
    order_items.each do |item|
      ret = item.process!
      self.order_items.delete(item) if ret == false
    end
    
  end
  
  # Finalizes an in progress order after checkout is complete.
  # Called after transition to complete state when payments will have been processed
  def finalize!
    logger.info 'FINALIZE ORDER'
    
    update_attribute(:completed_at, Time.now)
    # self.out_of_stock_items = InventoryUnit.assign_opening_inventory(self)
    # lock any optional adjustments (coupon promotions, etc.)
    # adjustments.optional.each { |adjustment| adjustment.update_attribute("locked", true) }
    # OrderMailer.confirm_email(self).deliver
    
    # Mail products
    logger.info 'MAILING PRODUCTS'
    
    OrderMailer.order_email(self).deliver
    
    # Mail via sms
    if self.mobile_number.empty? == false then
      sms = SMS.new()
      sms.create(self.mobile_number, self)
    end
    

    self.state_events.create({
      :order_id       => self.id,
      :previous_state => "cart",
      :next_state => "complete",
      :name => "order" ,
      :user_id => (User.respond_to?(:current) && User.current.try(:id)) || self.user_id
     })
  end  
  
  def billing!
    logger.info 'START BILLING'
    
    invoice = Invoice.new(:email => (User.respond_to?(:current) && User.current.try(:email)))
    invoice.user = self.user
    invoice.order = self
    invoice.save
    
    invoice.process(self)
    
    # invoice.add_invoice_item
    # invoice.add_account_item
  end
  
  def payment
    payments.first
  end

  def available_payment_methods
    @available_payment_methods ||= PaymentMethod.available(:front_end)
  end

  def payment_method
    if payment and payment.payment_method
      payment.payment_method
    else
      available_payment_methods.first
    end
  end
  
  def products
    order_items.map{|li| li.variant.product}
  end

  private
  def create_client
    self.email = user.email if self.user and not user.anonymous?
    self.user ||= User.anonymous!
  end
  
  # Updates the +payment_state+ attribute according to the following logic:
  #
  # paid when +payment_total+ is equal to +total+
  # balance_due when +payment_total+ is less than +total+
  # credit_owed when +payment_total+ is greater than +total+
  # failed when most recent payment is in the failed state
  #
  # The +payment_state+ value helps with reporting, etc. since it provides a quick and easy way to locate Orders needing attention.
  def update_payment_state
    if round_money(payment_total) < round_money(total)
      self.payment_state = "balance_due"
      self.payment_state = "failed" if payments.present? and payments.last.state == "failed"
    elsif round_money(payment_total) > round_money(total)
      self.payment_state = "credit_owed"
    else
      self.payment_state = "paid"
    end

    if old_payment_state = self.changed_attributes["payment_state"]
      self.state_events.create({
        :order_id       => self.id,
        :previous_state => old_payment_state,
        :next_state => self.payment_state,
        :name => "payment",
        :user_id => (User.respond_to?(:current) && User.current && User.current.id) || self.user_id
      })
    end
  end
  
    def round_money(n)
      (n*100).round / 100.0
    end
    
    # Updates the following Order total values:
    #
    # +payment_total+ The total value of all finalized Payments (NOTE: non-finalized Payments are excluded)
    # +item_total+ The total value of all LineItems
    # +adjustment_total+ The total value of all adjustments (promotions, credits, etc.)
    # +total+ The so-called "order total." This is equivalent to +item_total+ plus +adjustment_total+.
    def update_totals
      # update_adjustments
      # self.payment_total = payments.completed.map(&:amount).sum
      
      self.item_total = order_items.map(&:amount).sum
      self.billing_total = order_items.map(&:cost).sum
      self.customer_total = item_total
      self.full_total = item_total
    end
    
    # Updates each of the Order adjustments. This is intended to be called from an Observer so that the Order can
    # respond to external changes to LineItem, Shipment, other Adjustments, etc.
    # Adjustments will check if they are still eligible. Ineligible adjustments are preserved but not counted
    # towards adjustment_total.
    def update_adjustments
      self.adjustments.reload.each(&:update!)
    end
  
    # Determine if email is required (we don't want validation errors before we hit the checkout)
    def require_email
      return true unless new_record? or state == 'cart'
    end                    
  
end