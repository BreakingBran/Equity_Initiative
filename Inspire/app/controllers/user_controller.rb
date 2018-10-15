class UserController < ApplicationController

	def index
		#temporary for debgging can't actually have a way to show all users
		@users = User.all
	end

	def create
		# Needs to be modified
		@user = User.new(user_params)
    @user.save
		if @user
      # Testing only one session per computer so - if you create a new one just log out
      if logged_in?
        log_out
      end
      log_in(@user)
      redirect_to stories_path
    end
	end

	def new
		#Just for the view
	end

	def show
    # Check if logged in
    @logged_in = logged_in?

		if (params[:username])
			@user = User.find_by_username(params[:username])
		else
			@user = User.find(params[:id])
		end

	end

	def edit
		@user = current_user
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
			params.require(:user).permit(:first_name, :last_name, :username, :password, :bio)
		end
end
