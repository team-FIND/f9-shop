class Eshop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :ecategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :ecategory
	belongs_to :user

	has_many :emenucs, dependent: :destroy
	has_many :esmenucs, dependent: :destroy
	has_many :eequipcs, dependent: :destroy
	has_many :estaffcs, dependent: :destroy
	has_many :eequips, dependent: :destroy
	has_many :estaffs, dependent: :destroy

end