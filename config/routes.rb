Rails.application.routes.draw do

  resources :users do 
    resources :infos
  end
  resources :teachers, controller: 'users', type: 'Teacher'
  resources :students, controller: 'users', type: 'Student'
  
  resource :sessions, only: [:new, :create, :destroy]
  
  root 'users#index'

end
