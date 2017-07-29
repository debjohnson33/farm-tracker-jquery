class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas, inverse_of: :farm, :dependent => :destroy
	has_many :animals, through: :areas

	validates :name, presence: true

	accepts_nested_attributes_for :areas, reject_if: proc { |a| a[:name].blank? }
	
	def areas_attributes=(areas_attributes)
		areas_attributes.each do |i, area_attributes|
			self.areas.build(area_attributes)
		end
	end

end
