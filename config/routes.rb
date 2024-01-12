Rails.application.routes.draw do
  get 'comments/new'
  root 'profiles#index'
  resources :profiles do
    resources :articles, only: [:new, :create] do
      resources :comments, only: [:new, :create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
