SocialNetworc::Application.routes.draw do

  root 'wall#index'

  get "wall/index"
  resources :users ,only: [:new, :create]

  get 'profile' => 'users#profile'
  post 'user_search' => 'admin/pages#user_search' 
  

  namespace :admin do 
		get '/', to: 'pages#index'
  end

  post "new_post" => 'posts#create' 
  post "update_post" => 'posts#update' 
  post "delete_post" => 'posts#destroy' 
  

  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'


end