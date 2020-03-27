class Fstaffc < ApplicationRecord

  validates :user_id, presence: true
  validates :fshop_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :fshop

  has_many :fstaffs
  
end
