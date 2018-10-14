class CommentController < ApplicationController
	def new
	end

	def create
		@user = User.find(params[:user_id])
		@comment = @user.comments.create(comment_params)
		post_title = params[:post_title]
		#@post = Post.find(params(["comment"]["post_id"])
		@comment.save!
		#@comment.user_id = @user.id

		redirect_to post_show_path_url(username: @user.username, post_title: post_title)
	end


	private
		def comment_params
			params.require(:comment).permit(:message)
		end
end
