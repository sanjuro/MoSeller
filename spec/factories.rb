Factory.define :user do |user|
  user.name                  'Test'
  user.username              'sanjuro'
  user.password              'rad6hia'
  user.email                 'test@gmail.com'
  user.cap_left              1000.00
end

Factory.define :order do |order|
  order.number              'R123123123'
  order.client_id           1
  order.user_id             1
  order.mobile_number       ''
end