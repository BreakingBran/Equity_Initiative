class PostsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_username(params[:username])
		@post = Post.create(post_params)
		@user.posts << @post

		@post.verified = false
		@post.num_likes = 0

		if @post.save
			redirect_to show_post_path(username: @user.username, post_title: @post.title)
		else
      flash[:error] = 'Something went wrong while saving! We will work to fix this!'
		end
	end

	def show
		if params[:username]
			@user = User.find_by_username(params[:username])
			@post = @user.posts.find_by_title(params[:post_title])
		else
			# To support id paths
			@user = User.find(params[:user_id])
			@post = Post.find(params[:id])
		end
	end

	def index
		@user = User.find(params[:user_id])
		@posts = @user.posts.all
	end

	def edit
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@post = Post.find(params[:id])
		@post = Post.update(@post.id, post_params)
		redirect_to user_posts_path(@user.id)
	end

	def destroy
	end

  # API methods
  def addlike
    if params[:post_title]
      post = Post.find_by_title(params[:post_title])
      post.num_likes += 1;
      if post.save
        redirect_to show_post_path(username: post.user.username, post_title: post.title) and return
      end
    end
  end

	private
    def post_params
      params.require(:post).permit(:title, :category, :message)
 		end
end
