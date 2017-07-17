class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true


	def areas_attributes=(areas_attributes)
		areas_attributes.each do |i, area_attributes|
			#area_attributes.each do |attribute|
				#if attribute.empty?
					# how do ignore the blank attributes?
				#else 
					self.areas.build(area_attributes)
				#end
			#end
		end
	end
	
end
