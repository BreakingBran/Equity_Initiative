class PostsController < ApplicationController
	def new
	end

	def create
		#render plain: params[:post].inspect
		@user = User.find(params[:user_id])
		@post = @user.posts.create(post_params)

		@post.verified = false
		@post.num_likes = 0

		if @post.save
			redirect_to user_post_path(params[:user_id], @post.id)
		else
			render 'new'
		end
	end

	def show
		@post =  Post.find(params[:id])
	end

	def index
	end

	def update
	end

	def destroy
	end

	private
  		def post_params
    		params.require(:post).permit(:title, :category, :message, :verified, :num_likes)
 		 end
end
