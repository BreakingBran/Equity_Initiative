class UserController < ApplicationController
	def index
		#temporary for debgging can't actually have a way to show all users
		@users = User.all
	end

	def create
		@user = User.new(user_params)

		@user.save
		redirect_to @user
	end

	def new
		#Just for the view
	end

	def show
		# Find User
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
    		params.require(:user).permit(:first_name, :last_name, :usename, :password, :bio)
 		 end
end
