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
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def destroy

	end

	private
  		def user_params
    		params.require(:user).permit(:first_name, :last_name, :usename, :password, :bio)
 		 end
end
