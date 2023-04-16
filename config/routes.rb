Rails.application.routes.draw do
  
devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 devise_scope :user do
    post '/users/guest_sign_in', to: 'public/sessions#new_guest'
  end



#会員側
 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   get '/search', to: 'searches#search'
   resources :users do
     get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
     patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
     get '/like_posts' => 'posts#like_posts'
   end
   
   
   resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
   end

 end

 
devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
#管理者側
 namespace :admin do
   root 'homes#top'
   resources :users, only: [:index, :destroy]
   resources :posts, only: [:index, :destroy]
   resources :post_comments, only: [:index, :destroy]
 end

end
