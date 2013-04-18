Uscodepic::Application.routes.draw do
  root :to => 'dashboard#index'
  match 'dashboard' => 'dashboard#index', :via => :get

  devise_for :users

  resource :profile, :only => [:show, :edit, :update]

  resources :words
  resources :definitions
  resources :help_requests, :except => [:edit, :update, :destroy] do
    resources :responses, :only => [:new, :create]
  end
end
