Rails.application.routes.draw do
  devise_for :users
  comfy_route :cms_admin, :path => '/admin'

  resources :terms
  resources :lessons

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
