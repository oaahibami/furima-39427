Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :items do
    resources :purchases, only: [:index, :create]
  end
end