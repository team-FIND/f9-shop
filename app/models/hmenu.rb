class Hmenu < ApplicationRecord
	
	validates :user_id, presence: true
  validates :hmenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :hmenuc

	has_many :items

end