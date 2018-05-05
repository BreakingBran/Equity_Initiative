Rails.application.routes.draw do
  get 'welcome/index', to: 'welcome#index'
  get 'welcome', to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'user', to: 'user#create', as: 'user_create'

  resources :user do
  	resources :posts
  	resources :comments do 
  		resources :replies
  	end
  end

  root 'welcome#index'
end
