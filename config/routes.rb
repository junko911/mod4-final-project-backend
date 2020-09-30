Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  
  resources :likes
  resources :breeds
  resources :cats
  
  get '/categories', to: 'cats#categories'
  post '/cat_fav', to: 'cats#cat_fav'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
