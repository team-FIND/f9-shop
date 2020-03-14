class Auto < ApplicationRecord

	mount_uploader :topimg, FoodpictureUploader
	mount_uploader :autoimg1, FoodpictureUploader
	mount_uploader :autoimg2, FoodpictureUploader
	mount_uploader :autoimg3, FoodpictureUploader

	validates :user_id, presence: true
  validates :dmenu_id, presence: true
	validates :autoname1, presence: true

	belongs_to :user
	belongs_to :dmenu

end