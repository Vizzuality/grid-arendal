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
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :about_sections, except: :show do
    post :sort, on: :collection
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :site_sections, except: [:show, :new, :create]

  resources :news_articles,  except: [:show, :new, :create] do
    get :fetch, on: :collection
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  [:publications, :activities].each do |res|
    resources res, except: [:show] do
      patch 'publish', on: :member
      patch 'unpublish', on: :member
      patch 'make_featured', on: :member
      patch 'remove_featured', on: :member
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end

  resources :vacancies, except: [:show] do
    patch 'publish', on: :member
    patch 'unpublish', on: :member
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :events, except: :show do
    patch 'deactivate', on: :member
    patch 'activate',   on: :member
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  [:partners, :content_types, :tags].each do |res|
    resources res, except: [:show] do
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end

  [:collections, :albums].each do |res|
    resources res, except: [:show] do
      patch 'make_featured', on: :member
      patch 'remove_featured', on: :member
      patch 'update_tags', on: :member
      get 'flickr_update', on: :member
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end

  resources :photos, except: [:new, :create, :show] do
    patch 'make_featured',   on: :member
    patch 'remove_featured', on: :member
    get 'search_thumbnails', on: :collection
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :graphics, except: [:new, :create, :show] do
    patch 'make_featured',   on: :member
    patch 'remove_featured', on: :member
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :graphic_requests, only: [:index, :edit, :destroy]

  [:videos, :video_collections].each do |res|
    resources res, except: [:show] do
      patch 'make_featured',   on: :member
      patch 'remove_featured', on: :member
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end


  root to: 'admin_home#index'
end
