class Cequip < ApplicationRecord

  mount_uploader :equip_img, PictureUploader
  validates :user_id, presence: true
  validates :cequipc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :cequipc

end
