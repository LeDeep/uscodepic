Uscodepic::Application.routes.draw do

  devise_for :users

  resources :tools
  resources :subjects, :only => [:index]
  resources :types, :only => [:index]
  resources :help_requests, :except => [:edit, :update, :destroy]

  root :to => 'dashboard#index'

  match 'dashboard' => 'dashboard#index', :via => :get




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   tools :products

  # Sample resource route with options:
  #   tools :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-tools:
  #   tools :products do
  #     tools :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-tools
  #   tools :products do
  #     tools :comments
  #     tools :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     tools :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

 
end
