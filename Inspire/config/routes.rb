Rails.application.routes.draw do
  # Main Pages

  # Welcome Page
  get 'welcome/index', to: 'welcome#index'
  get 'welcome', to: 'welcome#index'
  get '/stories', to: 'welcome#stories'

  # User
  get '/profile/:username', to: 'user#show', as: 'user_show_path'
  get '/profile/:username/myprofile', to: 'user#show'

  # Posts
  get '/post/:username/:post_title', to: 'posts#show', as: 'show_post'
  get '/new/:username', to: 'posts#new', as: 'new_post'
  post 'create/:username', to: 'posts#create', as: 'create_post'

  # Login/Sessionns
  post '/login', to: 'sessions#create', as: 'login'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Self-defined Create
  post 'user', to: 'user#create', as: 'user_create'
  post '/user/:user_id/posts', to: 'posts#create', as: 'post_create'
  post '/user/:user_id/comments', to: 'comment#create', as: 'comment_create'

  # API Logic
  get '/stories/filter', to: 'welcome#filter', as: 'stories_filter'

  # Support CRUD operations
  resources :user do
  	resources :posts
    resources :comments
  end

  root 'welcome#index'
end
