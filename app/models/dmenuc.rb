class Dmenuc < ApplicationRecord
	
    validates :user_id, presence: true
    validates :dshop_id, presence: true
    validates :name, presence: true

    belongs_to :user
    belongs_to :dshop

    has_many :dmenus, dependent: :destroy
    has_many :autos, dependent: :destroy

end