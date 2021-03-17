Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'fixes#index'

  resources :fixes
  resources :users, only: [:show]
end