class Area < ApplicationRecord
	belongs_to :farm, inverse_of: :areas
	has_many :animals
	has_many :baby_animals, through: :animals

	validates :name, presence: true
	validates :farm_id, presence: true
end
