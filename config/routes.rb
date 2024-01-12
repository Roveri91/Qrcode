Rails.application.routes.draw do
  get 'comments/new'
  root 'profiles#index'
  resources :profiles
  resources :articles, only: [:new, :create, :show]
  resources :comments, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
