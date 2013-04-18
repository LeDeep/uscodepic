Uscodepic::Application.routes.draw do

  devise_for :users

  resources :tools
  resources :subjects
  resources :types
  resource :profile, :only => [:show, :edit, :update]
  resources :words
  resources :definitions
  resources :help_requests, :except => [:edit, :update, :destroy] do
    resources :responses, :only => [:new, :create]
  end
  root :to => 'dashboard#index'
  match 'dashboard' => 'dashboard#index', :via => :get
end
