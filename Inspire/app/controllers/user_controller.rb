class UserController < ApplicationController

	def index
		#temporary for debgging can't actually have a way to show all users
		@users = User.all
	end

	def create
		# Needs to be modified
		@user = User.new(user_params)

		@user.save
    # redirect_to welcome_index
    redirect_to stories_path
	end

	def new
		#Just for the view
	end

	def show
		# Find User

    # Check if logged in
    @logged_in = true
		if (params[:username])
			Rails.logger.debug(params[:username])
			@user = User.find_by_username(params[:username])
		else
			@user = User.find(params[:id])
		end

	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		User.update(user_params)

		redirect_to user_path(@user.id)
	end

	def destroy

	end

	private
  		def user_params
			params.require(:user).permit(:usename, :password, :bio)
		end
end
