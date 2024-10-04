# Routes (config/routes.rb)
Rails.application.routes.draw do
  root 'sessions#new'
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy' # Adding this line for GET requests
  resources :patients
  
  get 'dashboard', to: 'dashboard#index'
end