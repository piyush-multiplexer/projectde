module SessionsHelper
  # create session with user id and login
  def log_in(adminuser)
    session[:adminuser_id] = adminuser.id
  end
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Adminuser.find_by(id: session[:adminuser_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  # log out user
  def log_out
    session.delete(:adminuser_id)
    @current_user = nil
  end
end
