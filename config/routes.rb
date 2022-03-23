Rails.application.routes.draw do
  # get 'static_pages/home'
#   root 'static_pages#home'
#   get 'static_pages/help'
# # get 'static_pages/about'
#   get 'static_pages/contact'
#   resources :users
  root 'static_pages#home'
get '/help',
to: 'static_pages#help', as: 'helf'
get '/about',
to: 'static_pages#about'
get '/contact', to: 'static_pages#contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
