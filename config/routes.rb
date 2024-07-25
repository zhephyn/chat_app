Rails.application.routes.draw do
  resources :groups do
    resources :messages
  end 
  root "groups#index"
  devise_for :users
  get "/welcome", to: "welcome#home"
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
