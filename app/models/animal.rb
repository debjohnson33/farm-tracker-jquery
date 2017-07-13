class Animal < ApplicationRecord
	belongs_to :area
	belongs_to :user_animals, optional: true
	has_many :baby_animals
end
