class PostsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_username(params[:username])
		@post = Post.create(post_params)
		@user.posts << @post
		#@post = @user.posts.create(post_params)

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
			# To support old compatibility
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

	private
    def post_params
      params.require(:post).permit(:title, :category, :message)
 		end
end
