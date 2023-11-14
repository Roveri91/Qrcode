Rails.application.routes.draw do
  root 'profile#index'
  resources :profile
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
