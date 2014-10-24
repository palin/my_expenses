Rails.application.routes.draw do
  get 'auth/facebook', as: 'auth_provider'
  get 'auth/failure', to: 'sessions#destroy'
  get 'auth/facebook/callback', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'

  resources :expenses, only: [:index]

  root to: 'home#index'
end
