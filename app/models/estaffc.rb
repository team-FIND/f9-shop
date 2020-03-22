class Estaffc < ApplicationRecord

  validates :user_id, presence: true
  validates :eshop_id, presence: true
  validates :name, presence: true

  belongs_to :user
  belongs_to :eshop

  has_many :estaffs
    
  end
  