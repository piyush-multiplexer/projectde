class Complaint < ApplicationRecord
  belongs_to :user
  has_paper_trail
  mount_uploader :r_photo, RPhotoUploader
  mount_uploader :v_photo, VPhotoUploader
  mount_uploader :c_photo, CPhotoUploader
  mount_uploader :cm_photo, CmPhotoUploader
end
