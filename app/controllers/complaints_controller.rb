class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  # GET /complaints
  # GET /complaints.json
  def index
    if user_signed_in?
      @complaints = current_user.complaints.all
    end
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
      if @complaint.save
        format.html {redirect_to complaint_steps_path}
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
        format.html {redirect_to @complaint, notice: "Complaint was successfully updated. #{undo_link}"}
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
      format.html {redirect_to complaints_url, notice: "Complaint was successfully destroyed. #{undo_link}"}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_complaint
    # @complaint = current_user.complaints.all
    user_signed_in? ? @complaint = current_user.complaints.find(params[:id]) : @complaint = Complaint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def complaint_params
    # return {} unless params[:complaint].present?
    params.require(:complaint).permit(:r_fname, :r_lname, :r_age, :r_gender, :r_email, :r_phone, :r_pincode, :r_address, :r_photo, :v_fname, :v_lname, :v_age, :v_gender, :v_phone, :v_email, :v_address, :v_relation, :v_photo, :c_fullname, :c_age, :c_gender, :c_address, :c_photo, :c_details, :cm_type, :cm_location, :cm_date, :cm_rfactor, :cm_details, :cm_photo, :user_id, :complaintid)
  end

  def undo_link
    view_context.link_to('undo', revert_version_path(@complaint.versions(true).last), method: :post)
  end

end
