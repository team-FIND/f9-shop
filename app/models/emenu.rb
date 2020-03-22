class Emenu < ApplicationRecord
	
	validates :user_id, presence: true
  	validates :emenuc_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :emenuc

	has_many :outs

end