class VerificationsController < ApplicationController
  # load_and_authorize_resource
  def new
    @verification = Verification.new
  end

  def create
    @verification = Verification.find_or_create_by(phone_number: params[:verification][:phone_number])
    @verification.send_pin
    respond_to do |format|
      format.js # render app/views/phone_numbers/create.js.erb
    end
  end

  def verify
    @verification = Verification.find_by(phone_number: params[:hidden_phone_number])
    @verification.verify(params[:pin])
    respond_to do |format|
      format.js
    end
  end

end
