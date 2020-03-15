class Dstaffc < ApplicationRecord

  validates :user_id, presence: true
  validates :dshop_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :dshop

  has_many :dstaffs
  
end
