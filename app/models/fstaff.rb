class Fstaff < ApplicationRecord
  belongs_to :user
  belongs_to :fshop
  belongs_to :fstaffc
end
