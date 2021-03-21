Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'fixes#index'

  resources :fixes do
    resources :messages, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end