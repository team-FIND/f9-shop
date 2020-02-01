class Amenu < ApplicationRecord
	
	validates :user_id, presence: true
  	validates :amenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :amenuc

	has_many :foods
end
