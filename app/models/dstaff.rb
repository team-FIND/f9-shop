class Dstaff < ApplicationRecord
  belongs_to :user
  belongs_to :dshop
  belongs_to :dstaffc
end
