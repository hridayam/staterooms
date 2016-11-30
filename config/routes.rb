Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :listings


  get 'signup', to: 'users#new'

  get 'listings/new', to: 'listings#new'
  get 'listings', to: 'listings#index'
  get 'profile', to: 'users#show'

  #for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'home', to: 'pages#home'
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
