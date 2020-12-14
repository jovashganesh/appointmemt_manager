Rails.application.routes.draw do
  resources :contacts
  resources :appointments do
    resources :comments
  end
  get 'showall', to:'appointments#showall'
  devise_for :users
  root 'home#index'
end
