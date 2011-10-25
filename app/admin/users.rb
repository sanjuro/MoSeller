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

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :password
    end
    f.inputs "Buying" do
      f.input :cap_left
      f.input :cap_limit
    end
    f.buttons
  end
  
  action_item :only => :show do 
    link_to('Send Statement', statement_admin_users_path(user))
  end 
  
  # /admin/users/:id/statement
  member_action :statement do
    @user = User.find(params[:id])
    @orders = Order.unpaid(@user.id)
    @order_total = Order.unpaid(@user.id).sum("billing_total")
    OrderMailer.statement_email(@user, @orders, @order_total).deliver
    flash[:notice] = "Statement sent successfully!"
    redirect_to :action => :show, :notice => "Statement sent successfully!"
  end  
  
end
