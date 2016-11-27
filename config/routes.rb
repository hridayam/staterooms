Rails.application.routes.draw do

  resources :users, except: [:new]
  resources :listings

  get 'signup', to: 'users#new'

  get 'listings/new', to: 'listings#new'

  #for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
