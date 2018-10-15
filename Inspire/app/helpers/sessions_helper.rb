module SessionsHelper

  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out user - removes session id by settin it to nil
  def log_out
    session[:user_id] = nil
  end

  # Returns current user, or nil if not logged in
  def current_user
    if session[:user_id]
      # To avoid hitting the db multiple times
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if current user is logged in, else otherwise
  def logged_in?
    !current_user.nil?
  end

  # Returns true if user is the current user
  def is_current_user?(user)
    return user.username == current_user.username
  end
end
