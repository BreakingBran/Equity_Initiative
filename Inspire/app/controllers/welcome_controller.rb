class WelcomeController < ApplicationController
  def index
  end

  def login
  end

  def stories
    # Check if logged in
    # Change to logged in user
    @user = User.last
    @posts = Post.order(:num_likes).first(15)
  end

  def filter
    if params[:filter]
      filter_string = params[:filter][:filter_string]
      @posts = Post.order(:num_likes).where("title like ? OR category like ?", "%#{filter_string}%", "%#{filter_string}%").take(15)

      # Redirect to stories page
      render js: "window.location = '#{stories_path}'" # however overwrites posts
    end
  end
end