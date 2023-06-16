Rails.application.routes.draw do
  resources :carts
  resources :credit_cards
  resources :orders
  resources :billing_addresses
  resources :shipping_addresses
  resources :products
  resources :categories

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#new'

  get "sign_up", to: "users#new"
  get 'log_out', to: 'extra#new'
  get 'accounts', to: 'users#index', as: "users"
  get 'my_account', to: 'users#show'
  get 'products_by_category', to: 'products_by_category#new'
  get 'my_cart', to: 'carts#show'
  post 'carts/add'
  post 'carts/remove'
  post 'carts/update_quantity'

end
