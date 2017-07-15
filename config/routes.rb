Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :users, only: [:index, :edit, :update, :show] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :reads, only: [:index, :create, :destroy]
  resources :articles, only: [:index, :create, :show] do
    resources :picks, only: [:new, :create]
  end
  resources :likes, only: [:create, :destroy]
end
