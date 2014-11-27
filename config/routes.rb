Rails.application.routes.draw do
  root to: 'home#index'

  get 'auth/facebook', as: 'auth_provider'
  get 'auth/failure', to: 'sessions#destroy'
  get 'auth/facebook/callback', to: 'sessions#create'
  delete 'sessions/destroy', to: 'sessions#destroy'

  namespace :dashboard do
    root to: redirect('dashboard/expenses/new')

    resources :expenses, only: [:index, :new, :create, :edit, :update, :destroy]
    resource :profile, only: [:show, :edit, :update, :destroy]
    resource :settings, only: [:edit, :update]
  end
end
