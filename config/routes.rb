Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :applies, only: [:index, :create, :destroy] do
      collection do
        post 'allow'
        delete 'refuse'
      end
    end
    resources :room_users, only: [:index, :destroy]
    resources :events do
      resources :comments, only: [:create, :update, :destroy]
    end
  end
end
