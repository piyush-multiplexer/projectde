class ComplaintStepsController < ApplicationController
  include ComplaintStepsHelper
  helper ComplaintStepsHelper
  before_action :load_complaint
  before_action :authenticate_user!

  def edit
    if complaint_step_model.editable?
      if step.present?
        render step
      else
        render "#{Rails.root.to_s}/public/404.html", layout: false, status: 404
      end
    else
      redirect_to :back, alert: I18n.t("complaint.#{@complaint.status}_editable_error")
    end
  end

  def update
    if complaint_step_model.update_attributes(complaint_params || {})
      if next_step && params[:commit].downcase.include?('next')
        redirect_to edit_complaint_complaint_step_path(complaint_step_model, next_step)
      else
        redirect_to complaint_path(@complaint)
      end
    else
      render step, error: "Please complete all required fields"
    end
  end

  private

  def load_complaint
    @complaint = complaint_step_model
  end

  def complaint_params
    params.require(:complaint).permit('r_fname', 'r_lname', 'r_age', 'r_email', 'r_phone', 'r_pincode', 'r_address', 'r_photo', 'v_fname', 'v_lname', 'v_age', 'v_phone', 'v_email', 'v_address', 'v_relation', 'v_photo', 'c_fullname', 'c_age', 'c_address', 'c_photo', 'c_details', 'cm_type', 'cm_location', 'cm_date', 'cm_rfactor', 'cm_details', 'cm_photo', 'userid', 'complaintid')
  end

end
