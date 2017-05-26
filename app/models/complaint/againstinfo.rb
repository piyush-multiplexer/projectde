class Complaint::Againstinfo < Complaint
  # Include step validations here
  validates :c_fullname, :c_age, :c_gender, :c_address, :c_details, :c_photo, presence: true, allow_blank: false, allow_nil: false
  # Include step after_initialize attribute default settings here

  # Include step after_save changes here

  def editable?
    true
  end
end
