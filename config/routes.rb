Rails.application.routes.draw do

  resources :users do 
    resources :infos
  end
  
  resource :sessions, only: [:new, :create, :destroy]
  
  resources :locations
  resources :yoga_classes
 
  root 'users#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :yoga_classes
      resources :locations
    end
  end

end
