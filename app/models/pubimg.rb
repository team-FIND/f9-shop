class Pubimg < ApplicationRecord

  mount_uploader :foodimg1, FoodpictureUploader
  mount_uploader :foodimg2, FoodpictureUploader
  mount_uploader :foodimg3, FoodpictureUploader

  validates :ashop_id, presence: true

  belongs_to :user
  belongs_to :ashop

end
