class WelcomeController < ApplicationController
  def index
  end

  def login
  end

  def stories
    # Check if logged in
    # Change to logged in user
    @user = User.last

    if params[:filter]
      filter_string = params[:filter][:filter_string]
      @posts = Post.order(:num_likes).where("title like ? OR category like ?", "%#{filter_string}%", "%#{filter_string}%").take(15)
    else
      @posts = Post.order(num_likes: :desc).first(15)
    end
  end

  def filter
    # Redirect to stories page - should be done in view
    if params[:filter] && params[:filter][:filter_string]
      render js: "window.location = '#{stories_path filter: {filter_string: params[:filter][:filter_string]}}'"
    end
  end
end