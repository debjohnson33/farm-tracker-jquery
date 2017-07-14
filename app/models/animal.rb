class Animal < ApplicationRecord
	belongs_to :area
	has_many :baby_animals
end
