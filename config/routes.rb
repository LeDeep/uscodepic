Uscodepic::Application.routes.draw do

  devise_for :users

  resources :words do
    resources :definitions
  end

  resources :definitions do 
    resources :votes
  end
  
  resources :help_requests, :except => [:edit, :update, :destroy]
  resources :tools
  resources :subjects
  resources :types
  resource :profile, :only => [:show, :edit, :update]
  resources :words
  resources :definitions
  resources :help_requests, :except => [:destroy] do
    resources :responses, :only => [:new, :create]
  end
  resources :skills, :only => [:new, :create, :index]
  resources :user_skills, :only => [:create, :destroy]

  root :to => 'dashboard#index'
  
  match 'dashboard' => 'dashboard#index', :via => :get
  match "/help_requests/:id/edit" => "help_requests#update", :via => :put

end
