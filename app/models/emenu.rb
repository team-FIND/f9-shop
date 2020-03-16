class Emenu < ApplicationRecord
  belongs_to :user
  belongs_to :eshop
  belongs_to :emenuc
end
