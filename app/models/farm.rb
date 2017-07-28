class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true

	accepts_nested_attributes_for :areas
	
	def areas_attributes=(areas_attributes)
		areas_attributes.each do |area_attributes|
			self.area = Area.where(name: area_attributes[:name]).first or create do |a|
				a.area_type = areas_attributes[:area_type]
				a.capacity = areas_attributes[:capacity]
	    		a.quantity = areas_attributes[:quantity]
	    	end
		end
	end

end
