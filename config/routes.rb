Rails.application.routes.draw do
  get 'retouches/index'
  root to: "retouches#index"
end
