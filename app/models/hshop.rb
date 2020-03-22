class Hshop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :hcategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :hcategory
	belongs_to :user

	has_many :hmenucs, dependent: :destroy
	has_many :hsmenucs, dependent: :destroy
	has_many :hequipcs, dependent: :destroy
	has_many :hstaffcs, dependent: :destroy
	has_many :hequips, dependent: :destroy
	has_many :hstaffs, dependent: :destroy

end