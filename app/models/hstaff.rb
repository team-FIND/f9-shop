class Hstaff < ApplicationRecord

  mount_uploader :staff_img, PictureUploader
  validates :user_id, presence: true
  validates :hstaffc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :hstaffc
  
end