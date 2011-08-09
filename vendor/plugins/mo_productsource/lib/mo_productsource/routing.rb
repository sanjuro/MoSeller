Rails.application.routes.draw do
  match 'productsources/new_product/:id', :to => 'productsources#new_product'
end
