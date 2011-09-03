Moseller::Application.routes.draw do
    
  devise_for :users do
     get "/users/sign_out", :to => "devise/sessions#destroy" # Add a custom sing out route for user sign out
  end


  get "users/new"

  root :to => "categorys#index"  
  
  get "pages/home" 
  get "pages/contact" 
  get "pages/about"

  
  
  resources :users

  
  resources :clients 
  resources :contacts
  resources :locations

  resources :categorys  
  
  resources :orders do
    post :populate, :on => :collection
    resources :order_items
  end
  
  match '/cart', :to => 'orders#edit', :via => :get, :as => :cart
  match '/cart', :to => 'orders#update', :via => :put, :as => :update_cart
  match '/cart/empty', :to => 'orders#empty', :via => :put, :as => :empty_cart
  
  resources :productsources 
  match 'productsources/order/', :to => 'productsources#order' 
  
  # non-restful checkout stuff
  match '/checkout/update/:state' => 'checkout#update', :as => :update_checkout
  match '/checkout/:state' => 'checkout#edit', :as => :checkout_state
  match '/checkout' => 'checkout#edit', :state => 'address', :as => :checkout  
  
  resources :products
   
  resources :suppliers 

  
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
