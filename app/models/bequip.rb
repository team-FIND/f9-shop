class Bequip < ApplicationRecord
  belongs_to :user
  belongs_to :bshop
  belongs_to :bequipc
end
