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
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :clazz
    column :stock_level
    column ("is_current") {|inventory_level| status_tag(inventory_level.state, inventory_level.is_current ? :ok : :error) }
    column :created_at, :sortable => :created_at do |inventory_level|
      inventory_level.updated_at
    end
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :product_source
      f.input :clazz
      f.input :stock_level
      f.input :is_current
      f.input :created_at
    end
    f.buttons
  end  

end
