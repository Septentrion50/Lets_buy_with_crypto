Rails.application.routes.draw do
  devise_for :users
  root to: 'real_estates#index'
  resources :users, only: [:show, :edit, :update], :path => 'my_profile'   
  resources :real_estates
  resources :charges, only: [:new, :create], :path => 'checkout'

  namespace :admin do
    resources :real_estates
  end

  # static pages
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/team', to: 'static_pages#team', via: 'get'
  match '/terms', to: 'static_pages#terms', via: 'get'
  match '/privacy_policy', to: 'static_pages#privacy_policy', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
