Rails.application.routes.draw do
  root to: 'home#index'
  get 'about/index'
  get 'home/index'

  # administration
  mount RailsAdmin::Engine => '/superadmin', as: 'rails_admin'

  # resources :complaints, only: [:create, :show] do
  #   resources :complaint_steps, only: [:edit, :update]
  # end

  # complaints and it's wizard
  resources :complaints
  resources :complaint_steps

  # otp verifications
  resources :verifications, only: [:new, :create]
  post 'verifications/verify' => "verifications#verify"

  # undo redo visioning
  post 'versions/:id/revert' => 'versions#revert', as: 'revert_version'
  resources :contacts, only: [:new, :create]

  # devise user overwrite
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      shared: 'users/shared',
      mailer: 'users/mailer',
      unlocks: 'users/unlocks',
      passwords: 'users/passwords'
  }
  # devise user 2FA
  resources :users do
    member do
      post :enable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'users/multi_factor_authentication#verify_disabled'
    end
  end
  # devise admin overwrite
  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      confirmations: 'admins/confirmations',
      shared: 'admins/shared',
      mailer: 'admins/mailer',
      unlocks: 'admins/unlocks',
      passwords: 'admins/passwords'
  }
  # devise admin 2FA
  resources :admins do
    member do
      post :enable_multi_factor_authentication, to: 'admins/multi_factor_authentication#verify_enable'
      post :disable_multi_factor_authentication, to: 'admins/multi_factor_authentication#verify_disabled'
    end
  end
end

