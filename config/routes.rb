Uscodepic::Application.routes.draw do

  devise_for :users

  resources :words
  resources :definitions
  resources :help_requests, :except => [:destroy] do
    resources :responses, :only => [:new, :create]
  end
  resources :stories, :except => :show do  
    resources :comments, :except => :show
  end
resources :comments, :except => :show do  
    resources :story_comments, :except => :show
  end

  root :to => 'dashboard#index'

  match 'dashboard' => 'dashboard#index', :via => :get

  # match 'edit_help_request' => 'help_requests#update', :via => :put
  match "/help_requests/:id/edit" => "help_requests#update", :via => :put
end
