Rails.application.routes.draw do

  get 'home/about'

  root 'home#top' # トップページ

  resources :menus, only: [:index, :show, :new, :create]

  get 'weekly_menus', to: 'menus#weekly', as: 'weekly_menus' # 今週のMENUページ
  get 'blogs', to: 'blogs#index', as: 'blogs' # BLOG一覧ページ

  devise_for :users # Deviseを使ったユーザー認証

end