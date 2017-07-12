class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas
end
