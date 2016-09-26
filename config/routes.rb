# frozen_string_literal: true
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # Backend
  mount Backend::Engine, at: 'manage'

  resources :staff, controller: "users" , only: [:index, :show]
  root 'home#index'
end
