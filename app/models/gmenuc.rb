class Gmenuc < ApplicationRecord
	
  validates :user_id, presence: true
  validates :gshop_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :gshop

end