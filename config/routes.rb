Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#new'
  get '/success', to: 'application#success', as: :success

  resources :users
end
