class Emenuc < ApplicationRecord
		
	validates :user_id, presence: true
	validates :eshop_id, presence: true
	validates :name, presence: true

	belongs_to :user
	belongs_to :eshopj

	has_many :emenus, dependent: :destroy
	has_many :outs, dependent: :destroy

end
