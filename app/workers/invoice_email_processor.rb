class InvoiceEmailProcessor
  
  @queue = :email_queue  
  
  def self.perform(invoice_id, user_id)  
    invoice = Invoice.find_by_id!(invoice_id) 
    
    InvoiceMailer.invoice_email(invoice, invoice.order).deliver
    
    invoice.state_events.create({
      :order_id       => invoice.order.id,
      :previous_state => "processing",
      :next_state     => "unpaid",
      :name           => "invoice",
      :user_id        => user_id
    })     
  end
end