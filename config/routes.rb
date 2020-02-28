Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :payment_methods, only: %i[new create index show]
end
