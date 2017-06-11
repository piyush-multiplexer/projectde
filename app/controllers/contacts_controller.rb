class ContactsController < ApplicationController
  before_action :set_title
  def set_title
    @page_title = 'ef'
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      @contact.save
      flash.now[:error] = nil
    else
      flash.now[:error] = "can't"
      render :new
    end
  end
end
