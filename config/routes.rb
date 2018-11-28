Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users do 
    resources :infos
  end
  
  resource :sessions, only: [:new, :create, :destroy]
  
  resources :locations
  resources :yoga_classes

  post "/search", to: "home#search", as: :search
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :yoga_classes
      resources :locations
    end
  end

end
