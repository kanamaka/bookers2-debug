Rails.application.routes.draw do
  get 'favorites/new'
  devise_for :users
  get 'home/about' => 'homes#about'
  root 'homes#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  resources :favorite
  root 'homes#top'
end