class Admenu < ApplicationRecord
	
	validates :user_id, presence: true
  	validates :admenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :admenuc

	has_many :drinks
end
