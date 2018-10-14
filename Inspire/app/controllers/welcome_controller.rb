class WelcomeController < ApplicationController
  def index
  end

  def login
  end

  def stories
    # Check if logged in
    # Change to logged in user
    @user = User.last
    @posts = Post.order(:num_likes).first(10)
  end
end
