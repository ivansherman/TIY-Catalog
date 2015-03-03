Rails.application.routes.draw do
  resources :listings 
  root 'listings#index'

  get 'authorize' => 'sessions#authorize'
  get 'verify' => 'sessions#verify'
  ##get 'trending' => 'listings#index'
  ##get 'shopping_cart' => 'users#shopping_cart'
  ##post 'add_to_cart' => 
end
