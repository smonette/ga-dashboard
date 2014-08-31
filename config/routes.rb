Rails.application.routes.draw do

  get "/", to: "site#index"
  get "/about", to: "sites#show"

  resources :users do
    post "/", to: "shoutouts#create"
  end

  get "/about_us", to: "site#about"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"
  get "/logout", to: "session#destroy"
  get "/signup", to: "users#new"
  resources :passwords

end
