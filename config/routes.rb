Rails.application.routes.draw do
  resources :residues
  resources :laboratories
  resources :departments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
