class Animal < ApplicationRecord
	belongs_to :area
	has_many :baby_animals

	validates :name, presence: true
	validates :age, presence: true
	validates :sex, presence: true
	validates :color, presence: true
	validates :weight, presence: true

	scope :goat, -> { where(animal_type: "goat") }
	scope :large, -> { where('weight > ?', 100) }

	before_save :erase_empty_baby_animals

	def baby_animals_attributes=(baby_animals_attributes)
		baby_animals_attributes.values.each do |baby_animal_attributes|
			if baby_animal_attributes[:_destroy].present?
				baby_animal_attributes.destroy
			else
				self.baby_animals.build(baby_animal_attributes)	
			end
		end
	end

	def erase_empty_baby_animals
		self.baby_animals = self.baby_animals.select { |b| b.name != ''}
	end

end
