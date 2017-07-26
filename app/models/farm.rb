class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas	
	has_many :animals, through: :areas
	has_many :farm_baby_animals
	has_many :baby_animals, through: :farm_baby_animals

	validates :name, presence: true
	validates :name, uniqueness: true

	accepts_nested_attributes_for :areas, :reject_if => proc { |a| a[:name].blank? }, :allow_destroy => true
	
end
