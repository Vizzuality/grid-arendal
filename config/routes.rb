# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Backend
  mount Backend::Engine, at: 'manage'

  resources :staff,                        controller: 'users',          only: [:index, :show]
  resources :activities,                                                 only: [:index, :show]
  resources :publications,                                               only: [:index, :show]
  resources :media, path: 'media-library', controller: 'media_library',  only: [:index, :show]
  resources :news,                         controller: 'news_articles',  only: [:index, :show]
  resources :about,                        controller: 'about_sections', only: [:index]

  root 'home#index'
end
