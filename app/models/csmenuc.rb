class Csmenuc < ApplicationRecord
	
  validates :user_id, presence: true
  validates :cshop_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :cshop

end
