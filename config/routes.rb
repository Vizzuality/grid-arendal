# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Backend
  mount Backend::Engine, at: 'manage', as: 'backend'

  resources :about, controller: 'about_sections', only: [:index] do
    get :disclaimer, on: :collection
  end

  resources :search, only: [:index]
  resources :events, only: [:show]

  [:publications, :activities].each do |res|
    resources res, only: [:show, :index] do
      get :paginate, on: :collection, defaults: { format: 'js' }
    end
  end

  resources :resources, only: [:index, :show] do
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :news, controller: 'news_articles', only: [:index] do
    get :paginate, on: :collection, defaults: { format: 'js' }
  end

  resources :staff, controller: 'users', only: [:show] do
    get :related_items, on: :collection, defaults: { format: 'js' }
  end
  get '/staff', to: redirect("/about#staff")

  resources :graphic_requests, only: [:new, :create, :show]

  resources :vacancies, only: [:show]

  root 'home#index'

  get 'indigenous', to: "static#indigenous"
  get 'climate/ipcc', to: "static#ipcc"
  get "/*any", via: :all, to: "errors#not_found", constraints: -> (req) { !(req.fullpath =~ /^\/assets|images|system\/.*/) }, as: :not_found
end
