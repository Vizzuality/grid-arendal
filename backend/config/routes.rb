# frozen_string_literal: true
Backend::Engine.routes.draw do
  devise_for :users, path: 'account',
                     path_names:  { sign_in:  'login',  sign_out: 'logout',
                                    password: 'secret', sign_up:  'register' },
                     controllers: {
                                    sessions:      'backend/users/sessions',
                                    registrations: 'backend/users/registrations',
                                    passwords:     'backend/users/passwords'
                                  },
                     class_name: '::User',
                     module: :devise

  scope :account do
    devise_scope :user do
      post 'register', to: 'users/registrations#create', as: :register
      post 'password', to: 'users/passwords#create',     as: :secret
      post 'edit',     to: 'users/registrations#edit',   as: :account_edit
    end
  end

  resources :users do
    patch 'deactivate',   on: :member
    patch 'activate',     on: :member
    patch 'make_admin',   on: :member
    patch 'make_publisher', on: :member
    patch 'make_contributor',  on: :member
  end

  root to: 'admin_home#index'
end
