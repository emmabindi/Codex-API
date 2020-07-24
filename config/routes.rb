Rails.application.routes.draw do
  get 'language/index'
  get 'categories/index'
  post '/login', to: 'user_token#create'
  get '/status', to: 'status#index'
  get '/status/user', to: 'status#user'
  post '/sign-up', to: 'users#create'
  get '/current-user', to: 'users#index'

  # get '/user/:id/analytics', to: 'analytics#index'
  get '/analytics/counts', to: 'analytics#counts'
  get '/analytics/activity', to: 'analytics#entries_by_date'
  get '/analytics/categories', to: 'analytics#categories'
  get '/analytics/languages', to: 'analytics#languages'

  delete '/user/:id', to: 'users#destroy'

  resources :journals
  resources :bookmarks
  resources :goals

  root to: 'landing#index'
end
