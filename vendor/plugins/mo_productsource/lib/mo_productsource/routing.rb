Rails.application.routes.draw do
  match 'productsources/order/', :to => 'productsources#order'
end
