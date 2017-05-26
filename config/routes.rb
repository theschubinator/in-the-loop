Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, path: "accounts"
  resources :users do 
    resources :tasks
  end

  resources :admin do 
  	resources :tasks
  end

  resources :categories
  get 'admin/:id/users', to: "admin#users", as: "admin_users"
  get 'admin/:id/users/:user_id', to: "admin#user_show", as: "admin_user"
  
  root 'home#index'
end
