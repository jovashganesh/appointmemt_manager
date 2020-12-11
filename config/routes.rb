Rails.application.routes.draw do
  resources :contacts
  resources :appointments
  get 'showall', to:'appointments#showall'
  # resources :nurses
  # resources :patients
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
