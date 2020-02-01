class Atmenu < ApplicationRecord
	
	validates :user_id, presence: true
  	validates :atmenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :atmenuc

	has_many :atakeouts

end
