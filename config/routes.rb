Rails.application.routes.draw do
  # get 'comments/new'
  resources :profiles, only: [:index, :show, :new, :create, :destroy] do
    resources :articles, only: [:new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  root 'profiles#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
