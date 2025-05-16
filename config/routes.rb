Rails.application.routes.draw do
  # Devise routes for User auth (if you’re using Devise)
  devise_for :users

  # Root path
  root 'polls#index'

  # Our CRUD routes
  resources :polls

  # Only create action for votes
  resources :votes, only: :create
end