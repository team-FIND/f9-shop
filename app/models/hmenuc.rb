class Hmenuc < ApplicationRecord
		
	validates :user_id, presence: true
	validates :hshop_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :hshop

	has_many :hmenus, dependent: :destroy
	has_many :items, dependent: :destroy

end