Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'movies#index'
  resources :movies, only: [:index] do
    get 'search', on: :collection, as: :search
  end
end
