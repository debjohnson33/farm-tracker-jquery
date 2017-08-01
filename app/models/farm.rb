class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas, inverse_of: :farm, :dependent => :destroy
	has_many :animals, through: :areas

	validates :name, presence: true

	accepts_nested_attributes_for :areas, reject_if: proc { |a| a[:name].blank? }
	
	def areas_attributes=(areas_attributes)
		areas_attributes.values.each do |area_attribute|
			area = Area.find_or_create_by(area_attribute)
				areas << area if area.persisted?
		end
	end

end
