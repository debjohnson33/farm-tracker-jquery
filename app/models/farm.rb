class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true

	accepts_nested_attributes_for :areas
	
	#def areas_attributes=(areas)
	#	areas.each do |area|
	#		self.area = Area.find_or_create_by(name: area.name)
	#		self.area.update(area)
	#	end
	#end

end
