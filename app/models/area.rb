class Area < ApplicationRecord

	belongs_to :top

	has_many :prefecs, dependent: :destroy

		def to_param
			name
		end

end