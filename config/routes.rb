Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root 'articles#index'

  resources :users, only: [:show,:edit,:update] do
    member do
      get 'out'
      patch 'withdraw'
    end
  end

  resources :articles do
    collection do
      get 'search'
      get 'rank'
      get 'map'
    end
    resource :favorites, only: [:create, :destroy]
    resources :reviews, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
