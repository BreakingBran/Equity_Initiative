Rails.application.routes.draw do

  # Main Pages

  # Welcome Page
  get 'welcome/index', to: 'welcome#index'
  get 'welcome', to: 'welcome#index'

  # User
  get '/:username', to: 'user#show'
  get '/:username/myprofile', to: 'user#index'

  # Posts
  get '/:username/:post_title', to: 'posts#show'

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
