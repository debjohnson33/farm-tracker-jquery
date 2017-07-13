class Animal < ApplicationRecord
	belongs_to :area
	belongs_to :user_animals
	has_many :baby_animals
end
