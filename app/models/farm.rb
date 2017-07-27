class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true

	before_save :erase_empty_areas
	
	def areas_attributes=(areas_attributes)
		areas_attributes.each do |i, area_attributes|
			self.areas.build(area_attributes)
		end
	end

	def erase_empty_areas
		self.areas = self.areas.select {|a| a.name && a.name != ''}		
	end
end
