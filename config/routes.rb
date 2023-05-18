Rails.application.routes.draw do
  devise_for :users
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'application#hello'

  get 'goodbye', to: 'application#goodbye'
  get 'extra', to: 'application#extra'
  get 'bye', to: 'application#bye'
  get "sign_up", to: "users#new"

end
