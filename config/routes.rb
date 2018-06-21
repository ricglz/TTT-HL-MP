Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/signup', to: 'users#new', as: :sign_up
  post '/signup', to: 'users#create'

  get '/success', to: 'application#success', as: :success

  resources :sessions
end
