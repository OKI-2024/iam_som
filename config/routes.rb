Rails.application.routes.draw do
  devise_for :users
  root to: "reviews#index"
  resources :wines, only: [:show] do
    collection do
      get 'search'
      get 'autocomplete'
    end
  end
  resources :reviews, only: [:index, :new, :create, :destroy]
  resources :users, only: [:edit, :update, :show]
end
