Rails.application.routes.draw do
  #devise_for :users 
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, path: "accounts"
  resources :users do 
    resources :tasks
  end
  resources :categories

  root 'home#index'
end
