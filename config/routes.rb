Rails.application.routes.draw do
  resources :requests
  resources :users
  resources :collections
  resources :residues
  resources :laboratories
  resources :departments
  resources :registers
  
  post '/update_weight', to: 'registers#update_weight'
  post '/generate_notification', to: 'collections#generate_notification'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
