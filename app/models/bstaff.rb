class Bstaff < ApplicationRecord
  belongs_to :user
  belongs_to :bshop
  belongs_to :bstaffc
end
