Factory.define :user do |user|
  user.name                  'Test'
  user.username              'sanjuro'
  user.password              'rad6hia'
  user.email                 'test@gmail.com'
end

Factory.define :order do |order|
  order.client_id           1
  order.user_id             1
end