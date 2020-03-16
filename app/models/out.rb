class Out < ApplicationRecord
  belongs_to :user
  belongs_to :eshop
  belongs_to :emenuc
  belongs_to :emenu
end
