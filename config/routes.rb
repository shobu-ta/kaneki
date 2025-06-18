Rails.application.routes.draw do
 
  # 管理者用の認証機能
  devise_for :admin

  # 管理者専用
  namespace :admin do
    root 'dashboard#index' 
    resources :menus, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :reviews, only: [:destroy]  # 商品に紐づくレビュー削除
    end
    resources :users, only: [:index, :show, :destroy] 
    resources :reviews, only: [:index, :destroy] 
    resources :reservations, only: [:index, :show, :edit, :update, :destroy] 
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy, :show] 
  end
  
  # 一般ユーザー用メニュー・ブログ閲覧
  resources :menus, only: [:index, :show]
  resources :blogs, only: [:index, :show]

  # ユーザーの認証機能
  devise_for :users

  # ユーザー専用
  namespace :users do
    resource :mypage, only: [:show, :edit, :update, :destroy], controller: 'users' # users/controllerで機能
    resources :reviews, only: [:index]
    resources :reservations, only: [:new, :create, :index, :show, :destroy] do
      collection do
        get :confirm
        post :confirm  
      end
    end  
    resources :menus, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    end
  
  end

  # 固定ページのルーティング
  get 'home/about'
  root 'home#top' 
  get 'weekly_menus', to: 'menus#weekly', as: 'weekly_menus' 
  
end