class Complaint::Victiminfo < Complaint
  # Include step validations here
  validates :v_fname, :v_lname, :v_age, :v_gender, :v_email, :v_phone, :v_address, :v_relation, :v_photo, presence: true, allow_blank: false, allow_nil: false
  # Include step after_initialize attribute default settings here

  # Include step after_save changes here

  def editable?
    true
  end
end
