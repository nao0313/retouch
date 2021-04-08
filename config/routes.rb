Rails.application.routes.draw do
  devise_for :users, controllers: {
     registrations: 'users/registrations' }
  root to: 'fixes#index'

  resources :fixes do
    resources :messages, only: [:create, :destroy]
  end
  resources :users, only: [:show]
end