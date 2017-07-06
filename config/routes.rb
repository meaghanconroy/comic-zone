Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :users, only: [:show] do
    resources :subscriptions, except: [:edit, :update]
  end
  namespace :api do
    namespace :v1 do
      resources :comics, only: [:index] do
        resources :users
      end
    end
  end

  resources :comics, except:[:destroy] do
    resources :subscriptions, except: [:edit, :update]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :comics, only: [:new, :edit, :destroy]
  end
end
