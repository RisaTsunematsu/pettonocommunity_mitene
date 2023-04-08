Rails.application.routes.draw do
  
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#会員側
 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   #get '/search', to: 'searches#search'
   resources :users
   resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
   end
 end
 
 
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
#管理者側
 namespace :admin do
   root 'homes#top'
   resources :users
   resources :posts
   resources :post_comments
 end
  





end
