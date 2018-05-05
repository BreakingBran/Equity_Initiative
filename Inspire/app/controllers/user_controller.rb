class UserController < ApplicationController
	def index

	end

	def create
		@user = User.new(user_params)

		@user.save
		redirect_to @user
	end

	def new

	end

	def show

	end

	def update

	end

	def destroy

	end

	private
  		def user_params
    		params.require(:user).permit(:first_name, :last_name, :usename, :password, :bio)
 		 end
end
