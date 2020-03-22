class Out < ApplicationRecord

	mount_uploader :topimg, PictureUploader
	mount_uploader :outimg1, PictureUploader
	mount_uploader :outimg2, PictureUploader
	mount_uploader :outimg3, PictureUploader

	validates :user_id, presence: true
  	validates :emenu_id, presence: true
	validates :outname1, presence: true

	belongs_to :user
	belongs_to :emenu

end