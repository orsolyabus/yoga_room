Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
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
  get "/terms", to: "home#terms", as: :terms
  
  resource :issues, only: [:create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :yoga_classes
      resources :locations
      get "/teachers", to: "users#teachers", as: :teachers
    end
  end

end
