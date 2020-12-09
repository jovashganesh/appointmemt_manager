Rails.application.routes.draw do
  resources :appointments
  resources :nurses
  resources :patients
  resources :contact_forms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
