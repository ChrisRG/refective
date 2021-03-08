Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :spaces, only: [:index, :show, :new, :create, :update, :destroy] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update, :destroy] do
    resources :messages, only: %i[create]
  end
end
