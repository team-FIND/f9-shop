class Hequip < ApplicationRecord

  mount_uploader :equip_img, PictureUploader
  validates :user_id, presence: true
  validates :hequipc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :hequipc
  
end
