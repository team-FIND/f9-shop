class Auto < ApplicationRecord

	mount_uploader :topimg, PictureUploader
	mount_uploader :autoimg1, PictureUploader
	mount_uploader :autoimg2, PictureUploader
	mount_uploader :autoimg3, PictureUploader

	validates :user_id, presence: true
  	validates :dmenu_id, presence: true
	validates :autoname1, presence: true

	belongs_to :user
	belongs_to :dmenu

end