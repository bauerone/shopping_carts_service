Rails.application.routes.draw do
  resources :shopping_carts

  get 'current_user_shopping_cart', to: 'shopping_carts#current_user_shopping_cart'
  post 'add_to_cart', to: 'shopping_carts#add_to_cart'
  delete 'delete_current_user_cart', to: 'shopping_carts#clean_cart'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
