Rails.application.routes.draw do
 
  resources :teachers
  root(to: "teachers#index")
  resource :sessions, only: [:new, :create, :destroy]
end
