Rails.application.routes.draw do
  post "/login", to: "user_token#create"
  get "/status", to: "status#index"
  get "/status/user", to: "status#user"
  post "/sign-up", to: "users#create"
  get "/current-user", to: "users#index"

  delete "/user/:id", to: "users#destroy"
  
  resources :journals
  resources :bookmarks
  resources :goals

  root to: 'landing#index'
end
