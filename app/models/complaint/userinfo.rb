class Complaint::Userinfo < Complaint
  # Include step validations here

  # Include step after_initialize attribute default settings here

  # Include step after_save changes here

  def editable?
    true
  end
end
