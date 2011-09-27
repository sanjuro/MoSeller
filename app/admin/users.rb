# app/admin/users.rb
ActiveAdmin.register User do

  # Create sections on the index screen
  scope :all, :default => true
 
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :email
  filter :name
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :name
    column :email
    column :created_at
    column :last_sign_in_at
    default_actions
  end

end
