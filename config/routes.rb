SocialNetworc::Application.routes.draw do

  root 'wall#index'

  get "wall/index"
  resources :users

  resources :friendship

  get 'profile' => 'users#profile'
  #get 'edit_profile' => 'users#edit_profile'
  post 'user_search' => 'admin/pages#user_search'
  get 'friend_send' => 'friendship#create'
  get 'friend_delete' => 'friendship#delete'
  get 'friend_accept' => 'friendship#accept'
  get 'friend_decline' => 'friendship#decline'
  get 'friend_cancel' => 'friendship#cancel'
  get 'friends' => 'friendship#friends'
  namespace :admin do 
		get '/', to: 'pages#index'
  end
  resources :posts
  post 'delete_post' => 'posts#destroy'
  post 'post_modal_window' => 'posts#new'
  post 'posts/update'

  

  resources :sessions, only: [:new,  :create, :destroy, :edit]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get '/edit_profile', to: 'users#edit_profile'

  match '/auth/:service/callback' , to: 'services#create', via: [:get,:post]
  resources :services, :only => [:index,:create,:destroy]



end