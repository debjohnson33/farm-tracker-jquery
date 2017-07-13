class UserAnimals < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :animal, optional: true
end
