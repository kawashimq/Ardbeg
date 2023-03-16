Rails.application.routes.draw do

  root to: "public/homes#top"
  # 検索機能のルーティング設定
    resources :reviews do
      collection do 
        get "search"
      end
    end
  # 顧客側のルーティング設定
  namespace :public do
    get 'about' => "homes#about"
    get "search" => "searches#search"
    get 'customer/confirm' => 'inquiries#confirm'
    resources :inquiries, only: [:new, :create]
    resources :customers, only: [:show, :edit, :update]
    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resource  :favorites, only: [:create, :destroy]
    end
  end
  # 管理者側のルーティング設定
  namespace :admin do
    resources :inquiries, only: [:index]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :production_areas, only: [:create, :edit, :index, :update, :destroy]
    resources :reviews, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
  end
  
  # ゲストログインのルーティング設定
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  omniauth_callbacks: 'public/omniauth_callbacks'
}  

  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

end
