class Invoice < ActiveRecord::Base
  attr_accessible :user_id, :margin, :sub_total, :tax,  
                  :total, :date_paid, :email, :state

  belongs_to :user     
  belongs_to :order          
  
  has_one :account_item    
                  
  has_many :state_events, :as => :stateful
  has_many :invoice_items, :dependent => :destroy    
  
  scope :recent, order("invoice.created_at")      
                          
  
  # order state machine (see http://github.com/pluginaweek/state_machine/tree/master for details)
  state_machine :initial => 'created', :use_transactions => false do
  
    event :next do
      transition :from => 'created',  :to => 'processing'
      transition :from => 'processing',  :to => 'mailed'
      transition :from => 'mailed',  :to => 'unpaid'
      transition :from => 'unpaid',  :to => 'paid'


      # note: some payment methods will not support a confirm step
      # transition :from => 'payment', :to => 'confirm',
      #                                :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

      # transition :from => 'payment', :to => 'complete'
    end

    event :writeoff do
      transition :to => 'writeoff', :if => :allow_writeoff?
    end
    event :reverse do
      transition :to => 'reverse', :from => 'alow_reverse'
    end
    event :unpaid do
      transition :to => 'unpaid', :from => 'paid', :if => :allow_unpaid?
    end   

    before_transition :to => 'unpaid' do |invoice|
      # order.process_payments! # process payments
      # order.process_order_items! # fetch products
    end

    after_transition :to => 'paid' do |invoice|
      # do account and product stuff here   
      invoice.mark_as_paid! 
      
    end

  end 
  
  def process(order)
    
    self.state_events.create({
      :previous_state => "created",
      :next_state     => "mailed",
      :name           => "invoice" ,
      :user_id        => (User.respond_to?(:current) && User.current.try(:id)) || self.user_id
    })
    
    order.order_items.each do |order_item|
      ret = self.add_invoice_item(order_item)
    end
    
    logger.info 'CREATED INVOICE ITEMS'   
    
    self.update!
    
    logger.info 'UPDATE INVOICE'    
    
    # mail the invoice and log the state
    self.mail!
    
    logger.info 'MAIL INVOICE'
    
    # create the related account item
    self.add_account_item!
    
    logger.info 'CREATED ACCOUNT ITEM'    
    
  end 
  
  def update!
    update_totals
    
    update_attributes_without_callbacks({
      :sub_total => sub_total,
      :total => total
    })    

    logger.info 'UPDATE INVOICE TOTALS'    

  end 
  
  def mail!
    
    InvoiceMailer.invoice_email(self, self.order).deliver
    
    self.state_events.create({
      :order_id       => self.order_id,
      :previous_state => "processing",
      :next_state     => "unpaid",
      :name           => "invoice" ,
      :user_id        => (User.respond_to?(:current) && User.current.try(:id)) || self.user_id
    })
    
  end
  
  def add_invoice_item(order_item)
    invoice_item = InvoiceItem.new( :quantity => order_item.quantity, :total => order_item.customer_price * order_item.quantity, :description => order_item.variant.sku)
    invoice_item.invoice = self
    invoice_item.save
  end
  
  def add_account_item!
    account_item = AccountItem.new( :credit => 0.00, 
                                    :debit => self.total)
    account_item.user = self.user
    account_item.account_item_type_id =  1
    account_item.account_status_id =  1
    account_item.save
  end
  
  def update_totals
    self.sub_total = invoice_items.map(&:total).sum
    self.total = invoice_items.map(&:total).sum
  end
  
  def invoice_location
    "#{Rails.root}/pdfs/invoice-#{self.id}.pdf"
  end
  
end