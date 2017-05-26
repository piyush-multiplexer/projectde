Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'
  resources :complaints, only: [:create, :show] do
    resources :complaint_steps, only: [:edit, :update]
  end

  resources :complaints
  root to: 'home#index'

  get 'about/index'
  get 'contact/index'
  get 'home/index'
  get 'contact/create'
  get 'contact/new'
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      shared: 'users/shared',
      mailer: 'users/mailer',
      unlocks: 'users/unlocks',
      passwords: 'users/passwords'
  }
  resources :users do
    member do
      post :enable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_disabled'
    end
  end

  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      confirmations: 'admins/confirmations',
      shared: 'admins/shared',
      mailer: 'admins/mailer',
      unlocks: 'admins/unlocks',
      passwords: 'admins/passwords'
  }
  resources :admins do
    member do
      post :enable_multi_factor_authentication, to: 'admins/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'admins/multi_factor_authentication#verify_disabled'
    end
  end
end

