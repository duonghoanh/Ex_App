Rails.application.routes.draw do
  root to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # post '/signup' => 'users#create', :as => 'user'
  resources :users, only: %i[show new create edit index destroy]
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :sessions, only: %i[new create destroy]
  resources :account_activations, only: [:edit]
  resources :microposts, only: %i[create destroy]
end
