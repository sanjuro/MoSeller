# app/admin/invetory_level.rb
ActiveAdmin.register InventoryLevel do

  # Create sections on the index screen
  scope :all, :default => true
  # scope :complete
  # scope :incomplete

  # Filterable attributes on the index screen
  filter :clazz
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :stock_level
  filter :update_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :clazz
    column :stock_level
    column :updated_at, :sortable => :updated_at do |inventory_level|
      inventory_level.updated_at
    end
    default_actions
  end

end
