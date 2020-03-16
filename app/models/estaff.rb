class Estaff < ApplicationRecord
  belongs_to :user
  belongs_to :eshop
  belongs_to :estaffc
end
