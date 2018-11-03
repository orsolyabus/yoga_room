Rails.application.routes.draw do
 
  resources :teachers
  root(to: "teachers#index")
end
