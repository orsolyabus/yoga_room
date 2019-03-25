Rails.application.routes.draw do
  mount Crono::Web, at: "/crono"
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users do 
    resources :infos
    resources :saved_searches, only: [:create, :destroy, :show]
  end
  get "users/:id/thx", to: "users#thank_you", as: :thx
  
  resource :sessions, only: [:new, :create, :destroy]
  
  resources :locations

  get "/yoga_classes/search", to: "yoga_classes#search", as: :yoga_class_search
  resources :yoga_classes
  
  root "home#index"
  get "/contact", to: "home#contact", as: :contact
  get "/privacy", to: "home#privacy", as: :privacy
  
  resource :issues, only: [:create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :yoga_classes
      resources :locations
    end
  end

end
