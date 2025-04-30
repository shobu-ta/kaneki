Rails.application.routes.draw do
  # 一般ユーザー用メニュー閲覧
  resources :menus, only: [:index, :show]

  # 管理者用の認証機能
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admin/sessions'
  }

  # 管理者専用の機能（ネームスペースを統一）
  namespace :admin do
    root 'dashboard#index' # 管理者ダッシュボード
    resources :menus, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # ユーザー用の認証機能
  devise_for :users

  # 固定ページのルーティング
  get 'home/about'
  root 'home#top' # トップページ

  get 'weekly_menus', to: 'menus#weekly', as: 'weekly_menus' # 今週のMENUページ
  get 'blogs', to: 'blogs#index', as: 'blogs' # BLOG一覧ページ
end