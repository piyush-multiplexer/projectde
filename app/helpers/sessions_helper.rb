module SessionsHelper
  # create session with user id
  def log_in(adminuser)
    session[:adminuser_id] = adminuser.id
  end
end
