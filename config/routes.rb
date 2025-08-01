Rails.application.routes.draw do
  
  # ゲストユーザーログイン
  post '/homes/guest_sign_in', to: 'home#guest_sign_in'

  # 固定ページのルーティング
  root 'home#top'
 
  # 一般ユーザー用メニュー・ブログ閲覧
  resources :menus, only: [:index, :show] do
    collection do
      get :weekly
    end
  end
  resources :blogs, only: [:index, :show]

  # 管理者の認証機能
  devise_for :admin

  # 管理者専用
  namespace :admin do
    root 'dashboard#index'

    get 'search', to: 'dashboard#search', as: :search


    resources :menus, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :reviews, only: [:destroy]
    end
    resources :users, only: [:index, :show, :destroy]
    resources :reviews, only: [:destroy]
    resources :reservations, only: [:index, :show, :edit, :update, :destroy]
    resources :blogs
  end

  # ユーザーの認証機能
  devise_for :users

  # ユーザー専用
  namespace :users do
    resource :mypage, only: [:show, :edit, :update, :destroy], controller: 'users'
    resources :reviews, only: [:index]

    resources :reservations, only: [:index, :show, :new, :create, :destroy] do
      collection do
        get :confirm
        post :confirm
      end
    end

    resources :menus, only: [:index, :show] do
      resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end
end
