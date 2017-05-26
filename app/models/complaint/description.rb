class Complaint::Description < Complaint
  # Include step validations here
  validates :cm_type, :cm_location, :cm_date, :cm_rfactor, :cm_details, :cm_photo, presence: true, allow_blank: false, allow_nil: false
  # Include step after_initialize attribute default settings here

  # Include step after_save changes here

  def editable?
    true
  end
end
