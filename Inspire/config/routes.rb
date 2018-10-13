Rails.application.routes.draw do

  # Main Pages

  # Welcome Page
  get 'welcome/index', to: 'welcome#index'
  get 'welcome', to: 'welcome#index'
  get '/stories', to: 'welcome#stories'

  # User
  get '/profile/:username', to: 'user#show', as: 'user_show_path'
  get '/profile/:username/myprofile', to: 'user#show'
  get '/login', to: 'user#login'

  # Posts
  get '/post/:username/:post_title', to: 'posts#show', as: 'post_show_path'

  # Crud Routing

  # Special Create
  post 'user', to: 'user#create', as: 'user_create'
  post '/user/:user_id/posts', to: 'posts#create', as: 'post_create'
  post '/user/:user_id/comments', to: 'comment#create', as: 'comment_create'

  # Support CRUD operations
  resources :user do
  	resources :posts
    resources :comments
  end

  root 'welcome#index'
end
