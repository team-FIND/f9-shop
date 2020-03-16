class Hstaff < ApplicationRecord
  belongs_to :user
  belongs_to :hshop
  belongs_to :hstaffc
end
