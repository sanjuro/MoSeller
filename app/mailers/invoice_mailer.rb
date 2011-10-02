class InvoiceMailer < ActionMailer::Base

  def invoice_email(invoice, order)
    @invoice = invoice
    @order = order
    mail( :to => invoice.email, 
          :from => "headhancho@moseller.com",
          :subject => "Invoice for Order Number "  + order.number)
  end
  
end
