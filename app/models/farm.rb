class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true
	
	def areas_attributes=(areas_attributes)
		areas_attributes.values.each do |area_attributes|
			area = Area.find_by(name: area_attributes[:name])
			if area
				self.areas << area unless self.areas.include?(area)
			end
		end
	end

end
