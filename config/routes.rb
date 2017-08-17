Rails.application.routes.draw do

  resources :users, :attractions, :rides

  root 'application#hello'

  # get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get 'rides/:id/take_ride', to: 'rides#ride', as: 'take_ride'
end