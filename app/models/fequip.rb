class Fequip < ApplicationRecord

  mount_uploader :equip_img, PictureUploader
  validates :user_id, presence: true
  validates :fequipc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :fequipc
  
end
