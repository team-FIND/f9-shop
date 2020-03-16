class Item < ApplicationRecord
  belongs_to :user
  belongs_to :hshop
  belongs_to :hmenuc
  belongs_to :hmenu
end
