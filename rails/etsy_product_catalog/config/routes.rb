Rails.application.routes.draw do
  resources :listings
  resources :categories do
    resources :listings
  end

  resources :listings do 
    member do
      post "add_to_cart"
    end
  end


  root 'listings#index'

  get 'verify' => 'sessions#verify'

  get 'authorize' => 'sessions#authorize'

end
