Rails.application.routes.draw do
  get 'favorites/new'
  devise_for :users
  get 'home/about' => 'homes#about'
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resources :favorite
  post 'book/:id' => 'favorites#create', as: 'create_like'
  delete 'book/:id' => 'favorites#destroy', as: 'destroy_like'
  root 'homes#top'
end