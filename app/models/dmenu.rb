class Dmenu < ApplicationRecord
	
	validates :user_id, presence: true
  validates :dmenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :dmenuc

	has_many :autos

end