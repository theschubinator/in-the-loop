Rails.application.routes.draw do
  #devise_for :users 
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :tasks
  resources :categories

  root 'home#index'
end
