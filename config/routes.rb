Rails.application.routes.draw do
  devise_for :users
  root to: 'fixes#index'
  resources :fixes, only: [:index, :new]
end
