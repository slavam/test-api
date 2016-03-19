Rails.application.routes.draw do
  resources :make_models
  resources :car_makes
  resources :car_models
  resources :marks
  resources :orders
  resources :order_states
  resources :cars
  put 'confirm', to: 'users#confirm'
  resources :users
  resources :locations
  resources :options
  resources :user_states
  resources :todos
  
  put 'users/login'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
