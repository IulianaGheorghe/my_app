Rails.application.routes.draw do
  resources :products
  resources :categories
  get 'accounts', to: 'users#index', as: "users"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#new'

  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'bye', to: 'application#bye'
  get "sign_up", to: "users#new"
  get 'log_out', to: 'extra#new'

end
