SocialNetworc::Application.routes.draw do

  root 'wall#index'

  get "wall/index"
  post "wall/index" => "wall#ajax_read"
  resources :users ,only: [:new, :create]

  get 'profile' => 'users#profile'
  post 'user_search' => 'admin/pages#user_search' 
  

  namespace :admin do 
		get '/', to: 'pages#index'
  end
  resources :posts 
  post 'delete_post' => 'posts#destroy'
  post 'post_modal_window' => 'posts#new'
  post 'posts/update'

  

  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'


end