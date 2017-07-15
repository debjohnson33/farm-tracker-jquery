class BabyAnimal < ApplicationRecord
	belongs_to :animal

	validates :name, presence: true
	validates :age, presence: true
	validates :sex, presence: true
	validates :color, presence: true
	validates :weight, presence: true
	validates :animal_id, presence: true
end
