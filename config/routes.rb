Rails.application.routes.draw do

  resources :complaints, only: [:create, :show] do
    resources :complaint_steps, only: [:edit, :update]
  end

  resources :complaints
  root to: 'home#index'

  get 'about/index'
  get 'contact/index'
  get 'home/index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      shared: 'users/shared',
      mailer: 'users/mailer',
      unlocks: 'users/unlocks',
      passwords: 'users/passwords'
  }
  devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      confirmations: 'admins/confirmations',
      shared: 'admins/shared',
      mailer: 'admins/mailer',
      unlocks: 'admins/unlocks',
      passwords: 'admins/passwords'
  }
end
