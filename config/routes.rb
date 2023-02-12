Rails.application.routes.draw do

  # 顧客側のルーティング設定
  root to: "public/homes#top"
  
  namespace :public do
    get 'about' => "homes#about"
    get "search" => "searches#search"
    resources :reviews do
      resources :comments
      resource  :favorites, only: [:create, :destroy]
  end 
    resources :customers, only: [:show, :edit, :update]
  end

  # 管理者側のルーティング設定
  namespace :admin do
    get '/' => "homes#top"
    resources :production_areas, only: [:create, :edit, :index, :update, :destroy]
  end
  
  
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
