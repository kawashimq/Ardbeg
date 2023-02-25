Rails.application.routes.draw do

 
  root to: "public/homes#top"
  # DM機能のルーティング設定
  # resources :rooms, :only => [:show, :create] do
  #   resources :messages, :only => [:create]
  # end
  
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
    resources :reviews do
      resources :comments, only: [:create, :destroy]
      resource  :favorites, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update]
  end

  # 管理者側のルーティング設定
  namespace :admin do
    get '/' => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
    resources :production_areas, only: [:create, :edit, :index, :update, :destroy]
  end
  
  # ゲストログインのルーティング設定
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}  

  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
