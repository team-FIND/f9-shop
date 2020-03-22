class Gstaff < ApplicationRecord

  mount_uploader :staff_img, PictureUploader
  validates :user_id, presence: true
  validates :gstaffc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :gstaffc
  
end