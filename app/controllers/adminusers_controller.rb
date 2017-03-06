class AdminusersController < ApplicationController
  def new
    # create new instance
    @adminuser = Adminuser.new
  end

  def create
    # store in db if success else render new
    @adminuser = Adminuser.new(adminusers_params)
    if @adminuser.save
      log_in @adminuser
      flash[:success] = 'Welcome Your Account has been created!'
      redirect_to @adminuser
    else
      render 'new'
    end
  end

  def show
    # find user by id
    @adminuser = Adminuser.find(params[:id])
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @page_title = 'Admin Area'
  end
  # for default mass assignment params and permit other data
  private
  def adminusers_params
    params.require(:adminuser).permit(:username, :email, :password, :password_confirmation)
  end
end
