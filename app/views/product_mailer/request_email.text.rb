New Order for electricity: <%= @order.number %>
===============================================
 Order Number: <%= @order.number %>
    
    <% @order.order_items.each do |order_item| %>
    	<%= order_item.quantity %> X  <%= order_item.variant.product.name %> (<%= number_to_currency(order_item.variant.cost_price, :unit => "R", :separator => ".", :delimiter => ",") %> - <%= order_item.attribute_note %>
    <% end %>