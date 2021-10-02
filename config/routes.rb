Rails.application.routes.draw do
  get 'favorites/new'
  devise_for :users
  get 'home/about' => 'homes#about'
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books  do
   resource :comments, only: [:create, :destroy]
  end
  resource :favorite, only: [:create, :destroy]
  post 'book/:id' => 'favorites#create', as: 'create_favorite'
  delete 'book/:id' => 'favorites#destroy', as: 'destroy_favorite'
  root 'homes#top'
end