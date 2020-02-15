class Prefec < ApplicationRecord
	
	mount_uploader :citytop_img1, PictureUploader
	mount_uploader :newshop_img1, PictureUploader
	mount_uploader :newshop_img2, PictureUploader
	mount_uploader :newshop_img3, PictureUploader
	mount_uploader :newshop_img4, PictureUploader
	mount_uploader :newshop_img5, PictureUploader
	mount_uploader :newshop_img6, PictureUploader
	mount_uploader :newshop_img7, PictureUploader
	mount_uploader :newshop_img8, PictureUploader
	mount_uploader :newshop_img9, PictureUploader
	mount_uploader :newshop_img10, PictureUploader
	mount_uploader :adshop_img1, PictureUploader
	mount_uploader :adshop_img2, PictureUploader
	mount_uploader :adshop_img3, PictureUploader
	mount_uploader :adshop_img4, PictureUploader
	mount_uploader :adshop_img5, PictureUploader
	mount_uploader :adshop_img6, PictureUploader
	mount_uploader :adshop_img7, PictureUploader
	mount_uploader :adshop_img8, PictureUploader
	mount_uploader :adshop_img9, PictureUploader
	mount_uploader :adshop_img10, PictureUploader

	
	belongs_to :area

	has_many :ashops, dependent: :destroy
	has_many :bshops, dependent: :destroy
	has_many :cshops, dependent: :destroy
	has_many :dshops, dependent: :destroy
	has_many :eshops, dependent: :destroy
	has_many :fshops, dependent: :destroy
	has_many :gshops, dependent: :destroy
	has_many :hshops, dependent: :destroy

		def to_param
			name
		end

end