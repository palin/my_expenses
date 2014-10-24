Rails.application.routes.draw do
  delete 'sessions/destroy', to: 'sessions#destroy'

  resources :expenses, only: [:index]

  root to: 'home#index'
  get 'auth/facebook', as: 'auth_provider'
  get 'auth/facebook/callback', to: 'sessions#create'

end
