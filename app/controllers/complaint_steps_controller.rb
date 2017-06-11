class ComplaintStepsController < ApplicationController

  include Wicked::Wizard
  steps :userinfo, :victiminfo, :againstinfo, :description
  # load_and_authorize_resource
  before_action :authenticate_user!

  def show
    @complaint = current_user.complaints.last
    render_wizard
  end

  def update
    @complaint = current_user.complaints.last
    @complaint.update_attributes(complaint_params)
    render_wizard @complaint
  end

  private


  def redirect_to_finish_wizard(options = nil)
    generate_complaint_id
    redirect_to new_verification_path, notice: "Complaint was successfully created.#{undo_link}"
  end

  private

  def generate_complaint_id # under construction
    #@complaint = Complaint.last
    complaintid = "#{@complaint.id}#{@complaint.user_id}#{Random.rand}#{Date.today}"
    @complaint.update(complaintid: complaintid)
  end
  def complaint_params
    params.require(:complaint).permit('r_fname', 'r_lname', 'r_age', 'r_gender', 'r_email', 'r_phone', 'r_pincode', 'r_address', 'r_photo', 'v_fname', 'v_lname', 'v_age', 'v_gender', 'v_phone', 'v_email', 'v_address', 'v_relation', 'v_photo', 'c_fullname', 'c_age', 'c_gender', 'c_address', 'c_photo', 'c_details', 'cm_type', 'cm_location', 'cm_date', 'cm_rfactor', 'cm_details', 'cm_photo', 'userid', 'complaintid')
  end

  def undo_link
    view_context.link_to('undo', revert_version_path(@complaint.versions(true).last), method: :post)
  end
end
