class CommentController < ApplicationController
	def new
	end

	def create
		@user = User.find(params[:user_id])
		@comment = @user.comments.create(comment_params)
		#@post = Post.find(params(["comment"]["post_id"])
		@comment.save!
		#@comment.user_id = @user.id

		redirect_to user_posts_path(@user)
	end


	private
	def comment_params
		params.require(:comment).permit(:message)
	end
end
