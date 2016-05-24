Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  # resources :categories, only: [:index, :show] do
  #   resources :posts
  # end

  get 'categories/index' => "categories#index"
  get 'categories/:id' => "categories#show"

  get 'categories/:category_id/posts' => "posts#index"
  get 'categories/:category_id/posts/new' => "posts#new"
  post 'categories/:category_id/posts' => "posts#create"
  get 'categories/:category_id/posts/:post_id' => "posts#show"
  get 'categories/:category_id/posts/:post_id/edit' => "posts#edit"
  patch 'categories/:category_id/posts/:post_id' => "posts#update"
  delete 'categories/:category_id/posts/:post_id' => "posts#destroy"

  root 'categories#index'

  get 'sessions/logout' => "sessions#logout"
  get 'sessions/new' => "sessions#new"
  post 'sessions/create' => "sessions#create"
end
