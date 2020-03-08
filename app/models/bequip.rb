class Bequip < ApplicationRecord

  mount_uploader :equip_img, PictureUploader
  validates :user_id, presence: true
  validates :bequipc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :bequipc
end
