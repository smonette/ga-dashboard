Rails.application.routes.draw do

  get "/", to: "sites#index", as: 'root'
  get "/about", to: "sites#show"

  resources :users
  resources :shoutouts

  post "/shoutouts", to: 'shoutouts#create'

  get "/about_us", to: "sites#about"
  get "/login", to: "sessions#new"
  post "/", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  resources :passwords

end
