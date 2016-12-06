Rails.application.routes.draw do

  resources :users, except: [:new] do
    member do
      get :confirm_email
    end
  end
  resources :listings

  get 'signup', to: 'users#new'
  get 'users/edit', to: 'users#edit'

  # for listings
  get 'listings', to: 'listings#index'
  get 'listings/new', to: 'listings#new'
  post 'listings/advanced', to: 'listings#advanced'

  #for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # for messages
  get 'message', to: 'messages#index'
  get 'messages', to: 'messages#index'
  get 'messages/full', to: 'messages#full'
  post 'messages', to: 'messages#create'
  post 'messages/new', to: 'messages#new'
  post 'messages/reply', to: 'messages#reply'
  post 'messages/destroy', to: 'messages#destroy'

  get 'home', to: 'pages#home'
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
