Rails.application.routes.draw do

  get "/", to: "sites#index"
  get "/about", to: "sites#show"

  resources :users do
    post "/", to: "shoutouts#create"
  end

  get "/about_us", to: "sites#about"
  get "/login", to: "sessions#new"
  post "/", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  resources :passwords

end
