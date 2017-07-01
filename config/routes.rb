Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :users do
    resources :comics, only: [:index, :show]
    resources :subscriptions
  end
  namespace :api do
    namespace :v1 do
      resources :comics, only: [:index, :show] do
        resources :subscriptions
        resources :users
      end
    end
  end

  resources :comics, only:[:index, :show, :create] do
    resources :subscriptions
  end
  namespace :admin do
    resources :users
    resources :comics
  end
end
