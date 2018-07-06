Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'
  post '/', to: 'boards#create'
  get '/game/:id', to: 'boards#show', as: :game

  get '/signup', to: 'users#new', as: :sign_up
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new', as: :log_in
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout

  mount ActionCable.server => '/cable'
end
