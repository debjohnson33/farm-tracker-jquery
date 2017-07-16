class Farm < ApplicationRecord
	belongs_to :user, inverse_of: :farms
	has_many :areas, inverse_of: :farm
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :user_id, presence: true

	def areas_attributes=(areas_attributes)
		areas_attributes.each do |i, area_attributes|
			self.areas.build(area_attributes)
		end
	end
	
end
