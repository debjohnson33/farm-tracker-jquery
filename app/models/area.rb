class Area < ApplicationRecord
	belongs_to :farm
	has_many :animals
	has_many :baby_animals, through: :animals
end
