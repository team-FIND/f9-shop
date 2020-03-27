class Hmenuc < ApplicationRecord
	
  validates :user_id, presence: true
  validates :hshop_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :hshop

end
