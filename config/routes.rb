Rails.application.routes.draw do
  devise_for :users
  root to: 'retouches#index'
  resources :retouches, only: [:index]
end
