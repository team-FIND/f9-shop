class Top < ApplicationRecord

	validates :name, presence: false
	
	has_many :areas
  
	  def to_param
	    name
	  end

end