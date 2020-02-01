class Amenuc < ApplicationRecord
	
    validates :user_id, presence: true
    validates :ashop_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :ashop

	has_many :amenus, dependent: :destroy
	has_many :foods, dependent: :destroy
	
end
