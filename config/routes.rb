Rails.application.routes.draw do
  resources :requests
  resources :users
  resources :collections
  resources :residues
  resources :laboratories
  resources :departments
  resources :registers
  post '/update_weight', to: 'residues#update_weight'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
