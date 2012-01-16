class Invoice < ActiveRecord::Base
  
  include ActionView::Helpers::NumberHelper
  include BaseHelper
  
  attr_accessible :user_id, :margin, :sub_total, :tax,  
                  :total, :date_paid, :email, :state

  belongs_to :user     
  belongs_to :order          
  
  has_one :account_item    
                  
  has_many :state_events, :as => :stateful
  has_many :invoice_items, :dependent => :destroy    
  
  scope :recent, order("invoices.created_at")      
                          
  
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
      :stateful_type  => "invoice" ,
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
    Resque.enqueue(InvoiceEmailProcessor, self.id, self.user_id)    
  end
  
  def add_invoice_item(order_item)
    invoice_item = InvoiceItem.new( :quantity => order_item.quantity, :total => order_item.customer_price * order_item.quantity, :description => order_item.variant.sku)
    invoice_item.invoice = self
    invoice_item.save
  end
  
  def add_account_item!
    account_item = AccountItem.new( :description => 'Invoice no. ' + self.id.to_s(),
                                    :credit => 0.00, 
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
    "#{Rails.root}/tmp/invoice-#{self.id}.pdf"
  end
  
  def generate_pdf
    # Generate invoice
    Prawn::Document.generate self.invoice_location do |pdf|
      # Title
      pdf.text "Invoice ##{self.id}", :size => 25
  
      # Client info
      pdf.text self.user.name
      pdf.text self.user.email
  
      #pdf.draw_text "#{t('.created_at')}: #{l(invoice.created_at, :format => :short)}", :at => [pdf.bounds.width / 2, pdf.bounds.height - 30]
  
      # Our company info
      # pdf.float do
      # pdf.bounding_box [0, pdf.bounds.top - 5], :width => pdf.bounds.width do
      # pdf.text invoice.client.company.name, :size => 20, :align => :right
      # end
      # end
  
      pdf.move_down 20
  
      # Items
      header = ['Qty.', 'Description', 'Amount', 'Total']
        
      items = self.order.order_items.collect do |order_item|
        [order_item.quantity.to_s, order_item.presentation, format_price(order_item.variant.customer_price), format_price(order_item.quantity * order_item.customer_price)]
      end
     
      items = items + [["", "", "Discount:", "#{format_price(0.00)}"]] \
                    + [["", "", "Sub-total:", "#{format_price(self.sub_total)}"]] \
                    + [["", "", "Taxes:", "(#{format_price(self.tax)}%)"]] \
                    + [["", "", "Total:", "#{format_price(self.total)}"]]
  
      pdf.table [header] + items, :header => true, :width => pdf.bounds.width do
        row(-4..-1).borders = []
        row(-4..-1).column(2).align = :right
        row(0).style :font_style => :bold
        row(-1).style :font_style => :bold
      end
      
                       # :border_style => :grid,
                       # :headers => header,
                       # :width => pdf.bounds.width,
                       # :row_colors => %w{cccccc eeeeee},
                       # :align => { 0 => :right, 1 => :left, 2 => :right, 3 => :right, 4 => :right }
  
  
      # Terms
      # if invoice.terms != ''
      #   pdf.move_down 20
      #   pdf.text 'Terms', :size => 18
      #   pdf.text invoice.terms
      # end
  
      # Notes
      # if invoice.notes != ''
      #   pdf.move_down 20
      #   pdf.text 'Notes', :size => 18
      #   pdf.text invoice.notes
      # end
  
      # Footer
      # pdf.draw_text "Generated at #{l(Time.now, :format => :short)}", :at => [0, 0]
    end
  end  
  
end