include ActionView::Helpers::NumberHelper
include ActionView::Helpers::BaseHelper

def generate_invoice(invoice)
  # Generate invoice
  Prawn::Document.generate @invoice.invoice_location do |pdf|
    # Title
    pdf.text "Invoice ##{invoice.id}", :size => 25

    # Client info
    pdf.text invoice.user.name
    pdf.text invoice.user.email

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
    items = invoice.order.order_items.collect do |order_item|
      [order_item.quantity.to_s, order_item.presentation, format_price(order_item.variant.customer_price), format_price(order_item.quantity * order_item.customer_price)]
    end
   
    items = items + [["", "", "Discount:", "#{format_price(0.00)}"]] \
                  + [["", "", "Sub-total:", "#{format_price(invoice.sub_total)}"]] \
                  + [["", "", "Taxes:", "(#{format_price(invoice.tax)}%)"]] \
                  + [["", "", "Total:", "#{format_price(invoice.total)}"]]

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
    pdf.draw_text "Generated at #{l(Time.now, :format => :short)}", :at => [0, 0]
  end
end

# app/admin/invoices.rb
ActiveAdmin.register Invoice do

  # Create sections on the index screen
  scope :all, :default => true

  # Filterable attributes on the index screen
  filter :id
  filter :user
  
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :state
  filter :date_paid
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :user
    column :state
    column "Total", :sortable => :total do |invoice|
      format_price invoice.total
    end
    default_actions
  end
  
  # -----------------------------------------------------------------------------------
  # PDF
  
  action_item :only => :show do
    link_to "Generate PDF", generate_pdf_admin_invoice_path(resource)
  end
  
  member_action :generate_pdf do
    @invoice = Invoice.find(params[:id])
    generate_invoice(@invoice)
    
    # Send file to user
    send_file @invoice.invoice_location
  end  

  form do |f|
    f.inputs "Details" do
      f.input :user
      f.input :order_id
      f.input :margin
      f.input :sub_total
      f.input :tax
      f.input :total
      f.input :email  
      f.input :date_paid
      f.input :state
    end
    f.buttons
  end   
  
end
