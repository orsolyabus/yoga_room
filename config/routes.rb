Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users do 
    resources :infos
    resources :saved_searches, only: [:create, :destroy, :show]
  end
  
  resource :sessions, only: [:new, :create, :destroy]
  
  resources :locations

  get "/yoga_classes/search", to: "yoga_classes#search", as: :yoga_class_search
  resources :yoga_classes
  
  root 'home#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :yoga_classes
      resources :locations
    end
  end

end
