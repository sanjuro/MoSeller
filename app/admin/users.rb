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
    column :cap_left
    column :last_sign_in_at
    default_actions   
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :name
      f.input :username
      f.input :password, :type => :password
    end
    f.inputs "Login" do
      f.input :sign_in_count
      f.input :current_sign_in_at
      f.input :last_sign_in_at
    end
    f.inputs "Buying" do
      f.input :cap_left
      f.input :cap_limit
    end
    f.buttons
  end
  
  
  # Sidebar for show action  
  sidebar "Total Order Volume", :only => :show do
    attributes_table_for user do
      row('Ordered') { Order.by_user_id(user.id).all.count(&:customer_total) }
      row('Paid') { Order.by_user_id(user.id).paid.all.count(&:customer_total) }
      row('Not Paid') { Order.by_user_id(user.id).notpaid.all.count(&:customer_total) }
    end
  end    

  sidebar "Total Order Value", :only => :show do
    attributes_table_for user do
      row('Ordered') { format_price Order.by_user_id(user.id).all.sum(&:customer_total) }
      row('Paid') { format_price Order.by_user_id(user.id).paid.all.sum(&:customer_total) }
      row('Not Paid') { format_price Order.by_user_id(user.id).notpaid.all.sum(&:customer_total) }
    end
  end
  
  sidebar "Balance on Account", :only => :show do
    attributes_table_for user do
      row('Debit') { format_price AccountItem.by_user_id(user.id).all.sum(&:debit) }
      row('Credit') { format_price AccountItem.by_user_id(user.id).all.sum(&:credit) }
      row('Balance'){ format_price AccountItem.by_user_id(user.id).all.sum(&:debit) - AccountItem.by_user_id(user.id).all.sum(&:credit) }
    end
  end   
  
  # Extra actions for show action
  action_item :only => :show do 
    link_to('Send Statement', statement_admin_users_path(user))
  end 
  
  # /admin/users/:id/statement
  member_action :statement do
    @user = User.find(params[:id])
    @orders = Order.unpaid(@user.id)
    # @order_total = Order.unpaid(@user.id).sum("billing_total")
    credit_total = AccountItem.where("user_id =?", @user.id).sum("credit")
    debit_total = AccountItem.where("user_id =?", @user.id).sum("debit")
    p debit_total
    @order_total = debit_total - credit_total

    OrderMailer.statement_email(@user, @orders, @order_total).deliver
    flash[:notice] = "Statement sent successfully!"
    redirect_to :action => :show, :notice => "Statement sent successfully!"
  end  
  
end
