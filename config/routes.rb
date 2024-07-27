Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :groups
  resources :messages
  resources :users, only: [:show]
  #root "groups#index"
  root "welcome#home"
  get "up" => "rails/health#show", as: :rails_health_check
end
