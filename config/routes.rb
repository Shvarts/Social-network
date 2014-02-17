SocialNetworc::Application.routes.draw do

  root 'wall#index'

  get "wall/index"
  resources :users ,only: [:new, :create]

  get 'profile' => 'users#profile'
  post 'user_search' => 'admin/pages#user_search' 

  post 'wall/new' => 'wall#create'
  

  namespace :admin do 
		get '/', to: 'pages#index'
  end

  resources :wall do
    resources :posts
  end

  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'


end

