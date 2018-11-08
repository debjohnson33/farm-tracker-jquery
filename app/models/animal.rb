class Animal < ApplicationRecord
	belongs_to :area

	validates :name, presence: true
	validates :age, presence: true
	validates :sex, presence: true
	validates :color, presence: true
	validates :weight, presence: true

	scope :large, -> { where('weight > ?', 100) }
	scope :small, -> { where('weight <= ?', 100)}
end
