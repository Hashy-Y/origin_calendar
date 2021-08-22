Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :applies, only: [:index, :create, :destroy]
    resources :room_users, only: [:index, :create, :destroy]
    resources :events
  end
end
