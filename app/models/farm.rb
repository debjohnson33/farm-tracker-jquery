class Farm < ApplicationRecord
	belongs_to :user
	has_many :areas
	has_many :animals, through: :areas

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :user_id, presence: true
	
end
