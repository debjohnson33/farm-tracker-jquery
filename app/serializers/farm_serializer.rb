class FarmSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :user
  has_many :areas
  has_many :animals, through: :areas
end
