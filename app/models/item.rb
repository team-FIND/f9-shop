class Item < ApplicationRecord

	mount_uploader :topimg, PictureUploader
	mount_uploader :itemimg1, PictureUploader
	mount_uploader :itemimg2, PictureUploader
	mount_uploader :itemimg3, PictureUploader

	validates :user_id, presence: true
  	validates :hmenu_id, presence: true
	validates :itemname1, presence: true

	belongs_to :user
	belongs_to :hmenu

end