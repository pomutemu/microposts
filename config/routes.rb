Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/users/:id/followings' => 'users#followings', as: 'followings'
  get '/users/:id/followers' => 'users#followers', as: 'followers'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end
