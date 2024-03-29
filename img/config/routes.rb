Rails.application.routes.draw do
  root 'images#index'
  devise_for :users
  resources :images do
    resources :tags, :shallow => true
    resources :image_users, :shallow => true
  end
end
