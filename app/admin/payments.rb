# app/admin/payments
ActiveAdmin.register Payment do

  # Create sections on the index screen
  scope :all, :default => true

  # Filterable attributes on the index screen
  filter :id
  
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :order_id
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :id
    column :order_id
    column("state")   {|payment| status_tag(payment.state, payment.is_complete ? :ok : :error) }
    column :amount
    default_actions
  end  
  
  show do
    panel "Payment Details" do
      attributes_table_for payment do
        row("ID") { payment.id }
        row("Order") { payment.order_id }
        row("Status") { status_tag(payment.state) }
        row("Payment Total") { payment.amount }  
        row("Created At") { payment.created_at }
        row("Updated At") { payment.updated_at }
      end
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :state
      f.input :order_id
      f.input :source_type
      f.input :amount
    end
    f.buttons
  end    
  
end