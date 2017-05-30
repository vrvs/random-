Rails.application.routes.draw do
  resources :requests
  resources :users
  resources :collections
  resources :residues
  resources :laboratories
  resources :departments
  resources :registers
<<<<<<< HEAD
  post '/update_weight', to: 'residues#update_weight'
=======
  
  post '/update_weight', to: 'registers#update_weight'
>>>>>>> 4d7117e9d3448c11b14a32ebd182917105e2eb21
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
