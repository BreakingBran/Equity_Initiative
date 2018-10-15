class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username])

  	if user && user.authenticate(params[:session][:password])
      # Login user
      log_in(user)
      redirect_to stories_path
  	else
      # Render error message
      flash[:danger] = 'Invalid email/password'
      render 'welcome/index'
    end
  end

  def destroy
    if current_user
      # log user out
      log_out
      redirect_to root_path
    end
  end
end
