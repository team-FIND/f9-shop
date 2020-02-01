class Admenuc < ApplicationRecord
	
    validates :user_id, presence: true
    validates :ashop_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :ashop

	has_many :admenus, dependent: :destroy
	has_many :drinks, dependent: :destroy
	
end
