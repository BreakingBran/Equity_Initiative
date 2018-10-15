class CommentController < ApplicationController
	def new
	end

	def create
		if params[:user_id] && params[:post_title]
      @user = User.find(params[:user_id])
      @post = Post.find_by_title(params[:post_title])

      @comment = Comment.create(comment_params)

      @user.comments << @comment
      @post.comments << @comment
      @comment.save

      redirect_to show_post_path(username: params[:post_username], post_title: @post.title)
    else
      flash[:error] = 'Something happened while creating the comment... Hand tight!'
    end
	end


	private
		def comment_params
			params.require(:comment).permit(:message)
		end
end
