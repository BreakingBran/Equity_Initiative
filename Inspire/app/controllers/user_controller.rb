class UserController < ApplicationController
	def index

	end

	def create
<<<<<<< HEAD:Inspire/app/controllers/users_controller.rb
		@user = User.new(user_params)

		@user.save
		redirect_to @user
=======

>>>>>>> 90c7ec54d83e3fb35ce52f6f08a3639a2eec4f1d:Inspire/app/controllers/user_controller.rb
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
