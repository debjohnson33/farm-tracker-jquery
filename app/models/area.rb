class Area < ApplicationRecord
	belongs_to :farm
	has_many :animals
	has_many :baby_animals, through: :animals

	validates :name, presence: true

	def availability
		self.capacity - self.quantity
	end
end
