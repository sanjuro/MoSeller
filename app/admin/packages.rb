# app/admin/packages.rb
ActiveAdmin.register Package do

  # Create sections on the index screen
  scope :all, :default => true

  # Filterable attributes on the index screen
  filter :id
  
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :order_item_id
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :order_item_id
    column :payload
    column("used")  {|package| status_tag(package.state, package.is_used == 1 ? :warning : :ok) }
    column :created_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :order_item_id
      f.input :payload
      f.input :clazz
      f.input :is_used, :as => :boolean
      f.input :created_at
    end
    f.buttons
  end   
  
end
