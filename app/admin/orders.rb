# app/admin/orders.rb
ActiveAdmin.register Order do

  # Create sections on the index screen
  scope :all, :default => true
  scope :complete
  scope :incomplete

  # Filterable attributes on the index screen
  filter :number
  
  # filter :order_items, :as => :select, :collection => lambda{ Order.order_items }
  filter :user
  filter :item_total
  filter :customer_total
  filter :billing_total
  filter :full_total
  filter :state
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
    column :number
    column :state
    column :user
    column "Total", :sortable => :customer_total do |order|
      format_price order.customer_total
    end
    column :created_at
    default_actions
  end
   
  
  show do
    panel "Order Details" do
      attributes_table_for order do
        row("Status") { status_tag(order.state) }
        row("Payment") { status_tag(order.payment_state) }
        row("Number") { order.number }
        row("Customer Total") { order.customer_total }
        row("Billing Total") { order.billing_total }
        row("Full Total") { order.full_total }          
        row("Created At") { order.created_at }
        row("Completed At") { order.completed_at }
      end
    end
    
    panel "User Details" do
      attributes_table_for order do
        row("User Name") { order.user.username }
        row("User Email") { order.user.email }
      end
    end   
    
    panel "Delivery Details" do
      attributes_table_for order do
        row("Customer Name") { order.customer_name }
        row("Customer Mobile") { order.mobile_number }
      end
    end      
    
    panel "Order Items" do
      render('/admin/orders/order_items', :order_items => 'order.order_items')
    end  
     
    panel "Package Items" do
      render('/admin/orders/package_items', :order_items => 'order.order_items')
    end   
    
    panel "Payments" do
      render('/admin/orders/payment_items', :payment_items => 'order.payments')
    end    
   
    active_admin_comments
  end 
  
  form do |f|
    f.inputs "Details" do
      f.input :user
      f.input :number
      f.input :created_at
      f.input :updated_at
      f.input :completed_at
      f.input :state
    end
    f.inputs "Customer" do
      f.input :customer_name  
      f.input :email  
      f.input :mobile_number  
    end
    f.inputs "Totals" do
      f.input :item_total
      f.input :customer_total
      f.input :billing_total
      f.input :full_total
    end
    f.inputs :name => 'Order Item #%i', :for => :order_items
    f.buttons
  end  
  
  action_item :only => :show do 
    link_to('Pay Order', pay_admin_orders_path(order))
  end  
  
  # /admin/users/:id/statement
  member_action :pay do
    @order = Order.find(params[:id])
    @order.pay_order!
    
    flash[:notice] = "Order Paid successfully!"
    redirect_to :action => :show, :notice => "Order Paid successfully!"
  end  

end
