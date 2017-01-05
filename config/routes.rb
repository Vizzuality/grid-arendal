# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Backend
  mount Backend::Engine, at: 'manage'

  resources :staff, controller: 'users', only: [:index, :show]
  resources :news, controller: 'news_articles',  only: [:index]
  resources :about, controller: 'about_sections', only: [:index]
  resources :search, only: [:index]

  [:publications, :activities].each do |res|
    resources res, except: [:filters] do
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end

  resources :media, path: 'media-library', controller: 'media_library', except: [:filters] do
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  root 'home#index'
end
