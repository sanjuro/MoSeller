# app/admin/orders.rb
ActiveAdmin.register Order do

  # Create sections on the index screen
  scope :all, :default => true
  scope :complete
  scope :incomplete

  # Filterable attributes on the index screen
  filter :number
  
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :item_total
  filter :customer_total
  filter :billing_total
  filter :full_total
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :number
    column :user
    column "Total", :sortable => :customer_total do |order|
      format_price order.customer_total
    end
    default_actions
  end

end
