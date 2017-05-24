Rails.application.routes.draw do
  resources :categories
  resources :tasks
  devise_for :users
  root 'tasks#index'
end
