Rails.application.routes.draw do
  get 'mypets/new'
  get 'mypets/create'
  get 'mypets/edit'
  get 'mypets/update'
  get 'mypets/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'toppages/index'
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create]
  
  get "petsignup", to: "mypets#new"
  resources :mypets, only: [:new, :create, :edit, :update, :destroy]
end
