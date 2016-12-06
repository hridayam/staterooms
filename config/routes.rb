Rails.application.routes.draw do

  resources :users, except: [:new, :index] do
    member do
      get :confirm_email
    end
  end
  resources :listings

  get 'signup', to: 'users#new'
  get 'users/edit', to: 'users#edit'

  # for listings
  get 'listings/new', to: 'listings#new'
  get 'listings', to: 'listings#index'

  #for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # for messages
  get 'messages', to: 'messages#index'
  post 'messages/new', to: 'messages#new'
  post 'messages', to: 'messages#create'
  post 'messages/destroy', to: 'messages#destroy'

  get 'home', to: 'pages#home'
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
