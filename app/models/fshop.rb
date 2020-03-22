class Fshop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :fcategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :fcategory
	belongs_to :user

	has_many :fmenucs, dependent: :destroy
	has_many :fsmenucs, dependent: :destroy
	has_many :fequipcs, dependent: :destroy
	has_many :fstaffcs, dependent: :destroy
	has_many :fequips, dependent: :destroy
	has_many :fstaffs, dependent: :destroy

end