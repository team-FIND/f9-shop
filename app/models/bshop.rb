class Bshop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :bcategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :bcategory
	belongs_to :user

	has_many :bmenucs, dependent: :destroy
	has_many :bsmenucs, dependent: :destroy
	has_many :bequipcs, dependent: :destroy
	has_many :bstaffcs, dependent: :destroy
	has_many :bequips, dependent: :destroy
	has_many :bstaffs, dependent: :destroy

end