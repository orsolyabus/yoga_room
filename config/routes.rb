Rails.application.routes.draw do

  resources :users
  resources :teachers, controller: 'users', type: 'Teacher'
  resources :students, controller: 'users', type: 'Student'

  root 'users#index'

end
