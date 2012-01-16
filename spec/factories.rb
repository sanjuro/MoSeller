Factory.define :user do |user|
  user.name                  'Test'
  user.username              'sanjuro'
  user.password              'rad6hia'
  user.email                 'test@gmail.com'
  user.cap_left              1000
end

Factory.define :order do |order|
  order.number              'R123123123'
  order.client_id           1
  order.user_id             1
  order.mobile_number       ''
  order.customer_total      90
  order.billing_total       80
  order.full_total          100
end

Factory.define :inventory_level do |inventory_level|
  inventory_level.product_source_id     2
  inventory_level.clazz                 'FreepaidInventory'
  inventory_level.stock_level           1000
  inventory_level.is_current            1
end