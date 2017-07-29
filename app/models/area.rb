class Area < ApplicationRecord
	belongs_to :farm
	has_many :animals

	#validates :name, presence: true
	#validates :area_type, presence: true
	#validates :capacity, presence: true
	#validates :quantity, presence: true

	def availability
		self.capacity - self.quantity
	end
end
