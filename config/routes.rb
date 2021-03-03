Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  resources :spaces, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
  end
end
