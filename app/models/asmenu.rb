class Asmenu < ApplicationRecord
	
	validates :user_id, presence: true
  	validates :asmenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :asmenuc

end
