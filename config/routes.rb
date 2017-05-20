# frozen_string_literal: true

Rails.application.routes.draw do
  comfy_route :cms_admin, path: '/admin'

  namespace :admin do
    resources :calendar_items
    resources :lessons do
      member do
        get :download
      end
    end
    resources :users
    resources :terms
  end
  resources :calendar_items

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # Make sure this routeset is defined last
  comfy_route :cms, path: '/', sitemap: false
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
