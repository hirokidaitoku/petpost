Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  get 'posts/create'
  get 'posts/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
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
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :posts
      get :favorites
    end
  end
  
  
  get "petsignup", to: "mypets#new"
  resources :mypets, only: [:new, :create, :edit, :update, :destroy]
  
  resources :relationships, only: [:create, :destroy]
  
  resources :posts, only: [:create, :destroy]
  
  resources :likes, only: [:create, :destroy]
end
