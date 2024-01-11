Rails.application.routes.draw do
  root 'profiles#index'
  resources :profiles do
    resources :articles, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
