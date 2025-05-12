Rails.application.routes.draw do
  # 管理者用の認証機能
  devise_for :admin, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }

  # 管理者専用の機能（ネームスペースを統一）
  namespace :admin do
    root 'dashboard#index' # 管理者ダッシュボード
    resources :menus, only: [:index, :new, :create, :edit, :update, :destroy] # 商品管理
    resources :users, only: [:index, :show, :destroy] # 会員管理
    resources :reviews, only: [:index, :destroy] # レビュー管理
    resources :reservations, only: [:index, :show, :destroy] # 予約管理
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] # 管理者ブログ
  end

  # 一般ユーザー用メニュー閲覧
  resources :menus, only: [:index, :show]

  # ユーザー用の認証機能
  devise_for :users

  # ユーザー専用の機能
  namespace :users do
    resource :profile, only: [:show, :edit, :update] # プロフィール編集（ユーザー名・アバター画像）
    resource :account, only: [:edit, :update] do
      delete 'destroy', to: 'accounts#destroy' # 退会処理
    end

    resources :reservations, only: [:index] # 予約一覧
    resources :reviews, only: [:index] # レビュー一覧
  end

  # 固定ページのルーティング
  get 'home/about'
  root 'home#top' # トップページ

  get 'weekly_menus', to: 'menus#weekly', as: 'weekly_menus' # 今週のMENUページ
  get 'blogs', to: 'blogs#index', as: 'blogs' # BLOG一覧ページ
end