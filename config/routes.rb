# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Backend
  mount Backend::Engine, at: 'manage', as: 'backend'

  resources :about, controller: 'about_sections', only: [:index]
  resources :search, only: [:index]
  resources :events, only: [:show]

  [:publications, :activities].each do |res|
    resources res, only: [:show, :index] do
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end

  resources :media, path: 'resources', controller: 'media_library', only: [:index, :show] do
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :news, controller: 'news_articles', only: [:index] do
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :staff, controller: 'users' do
    get :related_items, on: :collection, defaults: { format: 'js' }
  end

  root 'home#index'
end
