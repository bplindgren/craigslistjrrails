Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :categories, only: [:index, :show] do
    resources :posts
  end

  root 'categories#index'

  get 'sessions/logout' => "sessions#logout"
  get 'sessions/new' => "sessions#new"
  post 'sessions/create' => "sessions#create"
end
