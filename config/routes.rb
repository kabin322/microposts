Rails.application.routes.draw do

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'edit', to:'users#edit'
  post 'edit', to:'users#update' 

  resources :users do
      get :followings
      get :followers
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end