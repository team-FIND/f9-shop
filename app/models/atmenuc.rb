class Atmenuc < ApplicationRecord
	
    validates :user_id, presence: true
    validates :ashop_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :ashop

	has_many :atmenus, dependent: :destroy
	has_many :atakeouts, dependent: :destroy
	
end
