Rails.application.routes.draw do

  get 'likes/create'

  get "/", to: "sites#index", as: 'root'
  get "/about", to: "sites#show"

  resources :users
  resources :shoutouts

  resources :likes

  post "/shoutouts", to: 'shoutouts#create'

  get "/show", to: "sites#show"
  get "/login", to: "sessions#new"
  post "/", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  resources :passwords

end
