Rails.application.routes.draw do

  resources :users do 
    resources :infos
  end
  
  resource :sessions, only: [:new, :create, :destroy]
  
  root 'users#index'

end
