class FarmSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :user
  has_many :areas
end
