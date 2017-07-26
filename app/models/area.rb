class Area < ApplicationRecord
	belongs_to :farm
	has_many :animals

	validates :name, presence: true

	def availability
		self.capacity - self.quantity
	end
end
