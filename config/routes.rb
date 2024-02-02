Rails.application.routes.draw do
  # get 'comments/new'
  resources :profiles, only: [:index, :show]
  resources :articles, only: [:new, :create, :show]
  resources :comments, only: [:new, :create]

  root 'profiles#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
