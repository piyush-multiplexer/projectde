Rails.application.routes.draw do
  resources :adminusers

  root 'home#index'

  get 'home/index'

  get 'home/show'

  get 'contactus/new'

  get 'contactus/create'

  get 'contactus/show'

  get 'contactus/update'

  get 'contactus/edit'

  get 'contactus/destroy'

  get 'contactus/index'

  get 'adminusers/new'

  get 'adminusers/create'

  get 'adminusers/show'

  get 'adminusers/update'

  get 'adminusers/edit'

  get 'adminusers/destroy'

  post 'adminusers/new', to: 'adminusers#create'
  get 'adminusers/index'

  get 'about/index'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'contactus' => 'contactus#index'
  get 'about' => 'about#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
