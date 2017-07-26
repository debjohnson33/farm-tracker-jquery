class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true
	
	def areas_attributes=(areas_attributes)
		areas_attributes.each do |i, area_attributes|
			if area_attributes[:_destroy].present?
				area_attributes.destroy
			else
				self.areas.build(area_attributes)
			end
		end
	end
end
