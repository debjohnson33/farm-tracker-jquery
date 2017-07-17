class Animal < ApplicationRecord
	belongs_to :area
	has_many :baby_animals

	validates :name, presence: true
	validates :age, presence: true
	validates :sex, presence: true
	validates :color, presence: true
	validates :weight, presence: true

end
