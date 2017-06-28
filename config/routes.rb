Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :users do
    resources :subscriptions
    resources :comics
  end
  
  resources :comics
  resources :subscriptions
end
