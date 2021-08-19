Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :users, only: [:edit, :update]
  resources :users, only: [:new, :create, :edit, :update]
end
