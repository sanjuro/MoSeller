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
