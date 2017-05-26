class Complaint::Userinfo < Complaint
  # Include step validations here
  validates :r_fname, :r_lname, :r_age, :r_email, :r_phone, :r_pincode, :r_address, :r_gender, :r_photo, presence: true, allow_blank: false, allow_nil: false
  # Include step after_initialize attribute default settings here
  # Include step after_save changes here

  def editable?
    true
  end
end
