Rails.application.routes.draw do
  # devise_for :members
  devise_for :users, controllers: { omniauth_callbacks: :callbacks }
  # "users/omniauth_
  # devise_for :users
  resources :tweets
  # , only: %i[index]
  # , only: %i[index show]
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "tweets#index"
  # root to: 'users#index'
  # get "/user", to: "users#show"
  get "/users/:username", to: "users#show", as: "user"
  patch "/user", to: "users#edit"
end
