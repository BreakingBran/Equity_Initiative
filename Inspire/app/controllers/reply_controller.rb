class ReplyController < ApplicationController
	def new
	end

	def create
		#render plain: params[:post].inspect
		@user = User.find(params[:user_id])
		@comment = Comment.find(params[:comment_id])
		@reply = @comment.replies.create(reply_params)

		if @reply.save
			redirect_to user_posts_path(params[:user_id])
		else
			render 'new'
		end
	end

	private
  		def reply_params
    		params.require(:reply).permit(:message)
 		end
end
