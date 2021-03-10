Rails.application.routes.draw do
  devise_for :users
  get 'retouches/index'
  root to: "retouches#index"
end
