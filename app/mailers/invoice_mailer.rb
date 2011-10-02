class InvoiceMailer < ActionMailer::Base

  def invoice_email(invoice, order)
    @invoice = invoice
    @order = order
    @url  = "http://localhost:3000/invoices/" + invoice.id.to_s()
    attachments["logo.png"] = File.read("#{Rails.root}/public/images/logo.png")  
    mail(:to => invoice.email, :subject => "Your invoice for Order Number "  + order.number)
  end
  
end
