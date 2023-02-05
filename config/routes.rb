Rails.application.routes.draw do
  
  # 顧客側のルーティング設定
  scope module: :public do
    get 'about' => "homes#about"
    root to: "homes#top"
  end
  

  # 管理者側のルーティング設定
  namespace :admin do
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
