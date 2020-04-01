class Gstaff < ApplicationRecord
  belongs_to :user
  belongs_to :gshop
  belongs_to :gstaffc
end
