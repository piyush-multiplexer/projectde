class SessionsController < ApplicationController
  def new
  end

  def create
    adminuser = Adminuser.find_by(email: params[:session][:email].downcase)
    if adminuser && adminuser.authenticate(params[:session][:password])
      log_in adminuser
      flash.now[:success] = 'Logged In.. ' + '\n'+ Time.now.to_s
      redirect_to adminuser
    else
      flash.now[:danger] = 'Invalid combination!!! ' #+ Time.now.to_s
      render 'new'
    end
  end

  def destroy

  end
end
