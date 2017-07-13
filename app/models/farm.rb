class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas
	has_many :animals, through: :areas
end
