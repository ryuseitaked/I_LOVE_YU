Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :users, only: [:show,:edit,:update] do
    member do
      get 'out'
      patch 'withdraw'
    end
  end

  resources :articles do
    resources :reviews, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
