class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas, inverse_of: :farm, :dependent => :destroy
	has_many :animals, through: :areas

	validates :name, presence: true

	#accepts_nested_attributes_for :areas, reject_if: proc { |a| a[:name].blank? }
	
	def areas_attributes=(areas_attributes)
		#raise areas_attributes.inspect
		areas_attributes.values.each do |area_attributes|
			area = Area.new(area_attributes)
			if self.areas.include?(area)
				area.update(area_attributes)
			else
				area.build(area_attributes)
			end
		end
	end

end
