class Hmenu < ApplicationRecord
  belongs_to :user
  belongs_to :hshop
  belongs_to :hmenuc
end
