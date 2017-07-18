class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true

	accepts_nested_attributes_for :areas, :reject_if => proc { |a| a[:name].blank? }, :allow_destroy => true
	#def areas_attributes=(areas_attributes)
	#	areas_attributes.each do |i, area_attributes|
	#		self.areas.build(area_attributes) unless area_attributes.empty?
	#	end
	#end
	
end
