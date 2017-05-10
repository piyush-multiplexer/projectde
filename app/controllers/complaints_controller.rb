class ComplaintsController < ApplicationController
  include ComplaintStepsHelper
  helper ComplaintStepsHelper

  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /complaints
  # GET /complaints.json
  def index
    @complaints = current_user.complaints.all
  end

  # GET /complaints/1
  # GET /complaints/1.json
  def show
  end

  # GET /complaints/new
  def new
    @complaint = current_user.complaints.new
  end

  # GET /complaints/1/edit
  def edit
  end

  # POST /complaints
  # POST /complaints.json
  def create
    @complaint = current_user.complaints.new(complaint_params)

    respond_to do |format|
      if @complaint.save(validation: false)
        format.html {redirect_to edit_complaint_complaint_step_path(@complaint, ComplaintStepsHelper::STEPS.first)}
        format.json {render :show, status: :created, location: @complaint}
      else
        format.html {render :new}
        format.json {render json: @complaint.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /complaints/1
  # PATCH/PUT /complaints/1.json
  def update
    respond_to do |format|
      if @complaint.update(complaint_params)
        format.html {redirect_to @complaint, notice: 'Complaint was successfully updated.'}
        format.json {render :show, status: :ok, location: @complaint}
      else
        format.html {render :edit}
        format.json {render json: @complaint.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /complaints/1
  # DELETE /complaints/1.json
  def destroy
    @complaint.destroy
    respond_to do |format|
      format.html {redirect_to complaints_url, notice: 'Complaint was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_complaint
    @complaint = current_user.complaints.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def complaint_params
    return {} unless params[:complaint].present?
    params.require(:complaint).permit(:r_fname, :r_lname, :r_age, :r_email, :r_phone, :r_pincode, :r_address, :r_photo, :v_fname, :v_lname, :v_age, :v_phone, :v_email, :v_address, :v_relation, :v_photo, :c_fullname, :c_age, :c_address, :c_photo, :c_details, :cm_type, :cm_location, :cm_date, :cm_rfactor, :cm_details, :cm_photo, :userid, :complaintid)
  end
end
