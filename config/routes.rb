Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :groups 
  resources :users, only: [:show] 
  resources :messages
  #root "groups#index"
  root "welcome#home"
  get "up" => "rails/health#show", as: :rails_health_check
end
