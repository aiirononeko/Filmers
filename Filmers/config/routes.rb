Rails.application.routes.draw do
  root to: 'home#home'
  resources :photos
  resources :users, only: %i[show new create edit update destroy]
  get '/admin', to: 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
