ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
     
  section "Recent Orders", :priority => 1 do
      table_for Order.order('id desc').limit(15) do
        column("Number") {|order| link_to(order.number, admin_order_path(order)) }
        column("State") {|order| status_tag(order.state) }
        column("Payment") {|order| status_tag(order.payment_state, order.is_paid ? :ok : :error) }
        column("Customer"){|order| link_to(order.user.username, admin_user_path(order.user)) }
        column("Billing") {|order| format_price order.billing_total }
        column("Customer") {|order| format_price order.customer_total }
        column("Profit") {|order| format_price order.customer_total - order.billing_total  }
        column("Date") {|order| order.completed_at? ? l(order.completed_at, :format => :long) : '-' } 
      end
  end       
    
  section "Recent Users", :priority => 3  do
      table_for User.order('last_sign_in_at desc').limit(10) do
          column("User") {|user| user.last_sign_in_at? ? link_to(user.name, admin_user_path(user)) + ' ' + 'signed in at' + ' ' + l(user.last_sign_in_at, :format => :long) : ''  }
      end     
  end

  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
