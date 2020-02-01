class Prefec < ApplicationRecord

	belongs_to :area

	has_many :ashops, dependent: :destroy
	has_many :bshops, dependent: :destroy
	has_many :cshops, dependent: :destroy
	has_many :dshops, dependent: :destroy
	has_many :eshops, dependent: :destroy
	has_many :fshops, dependent: :destroy
	has_many :gshops, dependent: :destroy
	has_many :hshops, dependent: :destroy

		def to_param
			name
		end

end