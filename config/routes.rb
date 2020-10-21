Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:index, :create]
    resource :like, only: [:show, :create, :destroy]
  end
  resource :profile, only: [:show, :edit, :update]
  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end
  resources :favorites, only: [:index]
  resources :notifications, only: [:index, :destroy]
  resources :searches, only: [:index]
end
