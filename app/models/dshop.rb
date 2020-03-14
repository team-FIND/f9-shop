class Dshop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :dcategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :dcategory
	belongs_to :user

	has_many :dmenucs, dependent: :destroy
	has_many :dsmenucs, dependent: :destroy
	has_many :dequipcs, dependent: :destroy
	has_many :dstaffcs, dependent: :destroy
	has_many :dequips, dependent: :destroy
	has_many :dstaffs, dependent: :destroy

end