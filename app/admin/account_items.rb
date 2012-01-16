# app/admin/account_items.rb
ActiveAdmin.register AccountItem do

  # Create sections on the index screen
  scope :all, :default => true
  # scope :complete
  # scope :incomplete

  # Filterable attributes on the index screen
  filter :user_id
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :credit
  filter :debitl
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :user
    column :debit
    column :credit
    column :created_at
    default_actions
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :user
      f.input :debit
      f.input :credit
      f.input :description
      f.input :created_at
      f.input :updated_at
    end
    f.buttons
  end    

end
