class InvoiceMailer < ActionMailer::Base

  def invoice_email(invoice, order)
    @invoice = invoice
    @order = order
    mail( :to => invoice.email, 
          :from => AppConfig.instance.admin_email,
          :subject => "Invoice for Order Number "  + order.number)
  end
  
end
