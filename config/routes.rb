Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :edit,:show,:update, :destroy]
  resources :users, only: [:show,:index, :edit, :update]
  get "/home/about" => "home#about", as: "about"
end