class ContactController < ApplicationController
  def index
    @page_title = 'Contact Us'
    @message = Contact.new
  end
  def new
    @message = Contact.new
  end
  def create
    @message = Contact.new message_params
    if @message.valid?
      ContactMailer.contact_me(@message).deliver
      redirect_to new_contact_url, notice: "Message received, thanks!"
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject)
  end

end
