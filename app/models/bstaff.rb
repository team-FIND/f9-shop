class Bstaff < ApplicationRecord
  validates :user_id, presence: true
  validates :bstaffc_id, presence: true
  validates :name, presence: true
  
  belongs_to :user
  belongs_to :bstaffc
end
