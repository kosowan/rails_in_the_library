Rails.application.routes.draw do

  root to: "home#index"

  # get 'home/index'
  get 'years/index'
  get 'years/show'
  get 'genres/index'
  get 'genres/show'
  get 'authors/index'
  get 'authors/show'
  get 'books/index'
  get 'books/show'
  get 'info/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :genres, only: [:index, :show]
  resources :years, only: [:index, :show]
  resources :info, only: :index
end
