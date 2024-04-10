Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :wines, only: :[:show] do
    resources :reviews, only: [:index, :new, :create] end
  resources :users, only: [:edit, :update]


end
