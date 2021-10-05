Rails.application.routes.draw do
  get 'favorites/new'
  devise_for :users
  get 'home/about' => 'homes#about'
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update] do
   resource :relationships, only: [:create, :destroy]
   get 'follow' => 'relationships#follow', as: 'follow'
   get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :relationships, only: [:index]
  resources :books  do
   resource :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :favorite, only: [:create, :destroy]
  post 'book/:id' => 'favorites#create', as: 'create_favorite'
  delete 'book/:id' => 'favorites#destroy', as: 'destroy_favorite'
  root 'homes#top'
  get '/search' => 'searches#search'
end