class Cshop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :ccategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :ccategory
	belongs_to :user

	has_many :cmenucs, dependent: :destroy
	has_many :csmenucs, dependent: :destroy
	has_many :cequipcs, dependent: :destroy
	has_many :cstaffcs, dependent: :destroy
	has_many :cequips, dependent: :destroy
	has_many :cstaffs, dependent: :destroy

end