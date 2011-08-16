class Order < ActiveRecord::Base
  attr_accessible :line_items, :bill_address_attributes, :payments_attributes,
                  :line_items_attributes, :use_billing, :special_instructions
                 
  belongs_to :client
  belongs_to :bill_address, :foreign_key => "bill_address_id", :class_name => "Address"

  has_many :state_events, :as => :stateful
  has_many :order_items, :dependent => :destroy
  has_many :payments, :dependent => :destroy

  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :bill_address
  accepts_nested_attributes_for :ship_address
  accepts_nested_attributes_for :payments
  accepts_nested_attributes_for :shipments
  
  before_create :create_client
  before_create :generate_order_number  
  
  scope :by_number, lambda {|number| where("orders.number = ?", number)}
  scope :between, lambda {|*dates| where("orders.created_at between ? and ?", dates.first.to_date, dates.last.to_date)}
  scope :by_customer, lambda {|customer| joins(:clients).where("clients.email =?", customer)}
  scope :by_region, lambda {|state| where("region = ?", state)}
  scope :complete, where("orders.completed_at IS NOT NULL")
  scope :incomplete, where("orders.completed_at IS NULL")
  
  def completed?
    !! completed_at
  end

  # Indicates whether or not the user is allowed to proceed to checkout. Currently this is implemented as a
  # check for whether or not there is at least one LineItem in the Order. Feel free to override this logic
  # in your own application if you require additional steps before allowing a checkout.
  def checkout_allowed?
    order_items.count > 0
  end

  # Is this a free order in which case the payment step should be skipped
  def payment_required?
    total.to_f > 0.0
  end

  # Indicates the number of items in the order
  def item_count
    order_items.map(&:quantity).sum
  end  
  
  # order state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => :cart, :use_transactions => false do

    event :next do
      transition :from => 'cart', :to => 'address'
      transition :from => 'address', :to => 'delivery'
      transition :from => 'delivery', :to => 'payment', :if => :payment_required?
      transition :from => 'delivery', :to => 'complete'
      transition :from => 'confirm', :to => 'complete'

      # note: some payment methods will not support a confirm step
      transition :from => 'payment', :to => 'confirm',
                                      :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

      transition :from => 'payment', :to => 'complete'
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
    event :authorize_return do
      transition :to => 'awaiting_return'
    end

    before_transition :to => 'complete' do |order|
      begin
        order.process_payments!
      rescue Spree::GatewayError
        if Spree::Config[:allow_checkout_on_gateway_error]
          true
        else
          false
        end
      end
    end

    after_transition :to => 'complete', :do => :finalize!
    after_transition :to => 'delivery', :do => :create_tax_charge!
    after_transition :to => 'payment', :do => :create_shipment!
    after_transition :to => 'canceled', :do => :after_cancel

  end  
  
  # FIXME refactor this method and implement validation using validates_* utilities
  def generate_order_number
    record = true
    while record
      random = "R#{Array.new(9){rand(9)}.join}"
      record = self.class.find(:first, :conditions => ["number = ?", random])
    end
    self.number = random if self.number.blank?
    self.number
  end
  
end