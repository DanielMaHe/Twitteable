Rails.application.routes.draw do
  # devise_for :members
  devise_for :users
  resources :tweets
  # , only: %i[index show]
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  # root to: 'users#index'
  # get "/users", to: "teewts#index"
end
