# frozen_string_literal: true
Backend::Engine.routes.draw do
  devise_for :users, path: 'account',
                     path_names:  { sign_in:  'login',  sign_out: 'logout',
                                    password: 'secret', unlock: 'unlock' },
                     controllers: {
                                    sessions:  'backend/users/sessions',
                                    passwords: 'backend/users/passwords',
                                    unlocks:   'backend/users/unlocks'
                                  },
                     class_name: '::User',
                     module: :devise

  devise_scope :user do
    get 'account/edit', to: 'users/accounts#edit',   as: 'edit_user_account'
    put 'account/:id',  to: 'users/accounts#update', as: 'update_user_account'
  end

  resources :users do
    patch 'deactivate',       on: :member
    patch 'activate',         on: :member
    patch 'make_admin',       on: :member
    patch 'make_publisher',   on: :member
    patch 'make_contributor', on: :member
  end

  resources :partners,       except: :show
  resources :about_sections, except: :show
  resources :news_articles,  except: :show

  [:publications, :activities].each do |res|
    resources res, except: [:show] do
      patch 'publish', on: :member
      patch 'unpublish', on: :member
      patch 'make_featured', on: :member
      patch 'remove_featured', on: :member
    end
  end

  resources :vacancies, except: [:show] do
    patch 'publish', on: :member
    patch 'unpublish', on: :member
  end

  resources :events, except: :show do
    patch 'deactivate', on: :member
    patch 'activate',   on: :member
  end

  resources :content_types, except: :show

  resources :tags, except: :show

  resources :media_contents, except: :show do
    patch 'publish',   on: :member
    patch 'unpublish', on: :member
  end

  root to: 'admin_home#index'
end
