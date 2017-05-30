Rails.application.routes.draw do
  resources :reportcells
  resources :reports
  resources :requests
  resources :users
  resources :collections
  resources :residues
  resources :laboratories
  resources :departments
  resources :registers
  
  post '/update_weight', to: 'registers#update_weight'
  post '/generate_reportcell', to: 'reportcells#generate_reportcell'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
