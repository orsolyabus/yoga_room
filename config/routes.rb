Rails.application.routes.draw do

  resources :users do 
    resources :infos
  end
  
  resource :sessions, only: [:new, :create, :destroy]
  
  root 'users#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
  #     resources :users do 
  #       resources :infos, only: [:new, :edit, :update, :create, :destroy]
  #     end
  #     resource :sessions, only: [:new, :create, :destroy]
      resources :yoga_classes
      resources :locations
      # resources :time_slots
    end
  end

end
