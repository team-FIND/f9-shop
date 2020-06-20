class Ashop < ApplicationRecord

	mount_uploader :topimage, PictureUploader
	mount_uploader :shopimage1, PictureUploader
	mount_uploader :shopimage2, PictureUploader
	mount_uploader :shopimage3, PictureUploader
    
    validates :user_id, presence: true
	validates :shopname, presence: true
	validates :top_id, presence: true
	validates :area_id, presence: true
	validates :prefec_id, presence: true
	validates :acategory_id, presence: true

	belongs_to :top
	belongs_to :area
	belongs_to :prefec
	belongs_to :acategory
	belongs_to :user
	
	has_many :amenucs, dependent: :destroy
	has_many :asmenucs, dependent: :destroy
	has_many :admenucs, dependent: :destroy
	has_many :atmenucs, dependent: :destroy
	has_many :amenus, dependent: :destroy
	has_many :foods, dependent: :destroy
	has_many :pubimgs, dependent: :destroy
	has_many :pubmenus, dependent: :destroy
	has_many :likes, dependent: :destroy
  	has_many :liked_posts, through: :likes, source: :user

end