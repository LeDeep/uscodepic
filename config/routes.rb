Uscodepic::Application.routes.draw do
  root :to => 'dashboard#index'

  match 'dashboard' => 'dashboard#index', :via => :get

  devise_for :users

  resources :help_requests, :except => [:edit, :update, :destroy]
end
