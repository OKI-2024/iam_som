Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :wines, only: [:show] do
    collection do
      get 'search'
      get 'autocomplete'
    end
    resources :reviews, only: [:new, :create, :edit, :update, :show]
  end
  resources :reviews, only: [:index, :destroy]
  resources :users, only: [:edit, :update, :show]
end
