Rails.application.routes.draw do
  namespace :admin do
    get 'blogs/index'
    get 'blogs/new'
    get 'blogs/create'
    get 'blogs/edit'
    get 'blogs/update'
    get 'blogs/destroy'
  end
  namespace :admin do
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/destroy'
  end
  namespace :admin do
    get 'reviews/index'
    get 'reviews/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/destroy'
  end
  # 一般ユーザー用メニュー閲覧
  resources :menus, only: [:index, :show]

  # 管理者用の認証機能
  devise_for :admin, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }

  # 管理者専用の機能（ネームスペースを統一）
  namespace :admin do
    root 'dashboard#index' # 管理者ダッシュボード
    resources :menus, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :destroy] # 会員管理
    resources :reviews, only: [:index, :destroy] # レビュー管理
    resources :reservations, only: [:index, :show, :destroy] # 予約管理
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] # 管理者ブログ

  end

  # ユーザー用の認証機能
  devise_for :users

  # 固定ページのルーティング
  get 'home/about'
  root 'home#top' # トップページ

  get 'weekly_menus', to: 'menus#weekly', as: 'weekly_menus' # 今週のMENUページ
  get 'blogs', to: 'blogs#index', as: 'blogs' # BLOG一覧ページ
end