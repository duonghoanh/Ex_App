Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  # post '/signup' => 'users#create', :as => 'user'
  resources :users, only: %i[new create show]
  get    '/login',  to: 'sessions#new_login'
  post   '/login',  to: 'sessions#create_login'
  delete '/logout', to: 'sessions#destroy'

end
