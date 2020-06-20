class Like < ApplicationRecord
  belongs_to :ashop
  belongs_to :bshop
  belongs_to :cshop
  belongs_to :dshop
  belongs_to :eshop
  belongs_to :fshop
  belongs_to :gshop
  belongs_to :hshop
  belongs_to :food
  belongs_to :user


  validates_uniqueness_of :ashop_id, scope: :user_id
end
