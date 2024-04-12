Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :wines, only: [:show]
  resources :reviews, only: [:index, :new, :create, :destroy]
  resources :users, only: [:edit, :update, :show]


end
