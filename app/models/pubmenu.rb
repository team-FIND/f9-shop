class Pubmenu < ApplicationRecord

  mount_uploader :img1, FoodpictureUploader
  mount_uploader :img2, FoodpictureUploader
  mount_uploader :img3, FoodpictureUploader

  validates :ashop_id, presence: true

  belongs_to :user
  belongs_to :ashop
end
