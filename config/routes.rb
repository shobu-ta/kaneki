Rails.application.routes.draw do
  
 
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 
  root 'home#top' # トップページ
  get 'menus', to: 'menus#index', as: 'menus' # MENUページ
  get 'weekly_menus', to: 'menus#weekly', as: 'weekly_menus' # 今週のMENUページ
  get 'blogs', to: 'blogs#index', as: 'blogs' # BLOG一覧ページ
  devise_for :users # Deviseを使ったユーザー認証

  

end
