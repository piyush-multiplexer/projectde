class SessionsController < ApplicationController
  def new
  end

  def create
    adminuser = Adminuser.find_by(email: params[:session][:email].downcase)
    if adminuser && adminuser.authenticate(params[:session][:password])
      log_in adminuser
      flash[:success] = 'Logged In.. '
      redirect_to adminuser
    else
      flash.now[:danger] = 'Invalid combination!!! '
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:info] = 'Logged Out...'
    redirect_to root_url
  end
end
