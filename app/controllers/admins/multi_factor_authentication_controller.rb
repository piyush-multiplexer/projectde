class Admins::MultiFactorAuthenticationController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin

  def verify_enable
    if current_admin == @admin &&
        current_admin.authenticate_otp(params[:multi_factor_authentication][:otp_code_token], drift: 60)
      current_admin.otp_module_enabled!
      redirect_to edit_admin_registration_path, notice: 'Two Factor Authentication Enabled'
    else
      redirect_to edit_admin_registration_path, alert: 'Two Factor Authentication could not be enabled'
    end
  end

  def verify_disabled
    if current_admin == @admin &&
        current_admin.authenticate_otp(params[:multi_factor_authentication][:otp_code_token], drift: 60)
      current_admin.otp_module_disabled!
      redirect_to edit_admin_registration_path, notice: 'Two Factor Authentication Disabled'
    else
      redirect_to edit_admin_registration_path, alert: 'Two Factor Authentication could not be disabled'
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
