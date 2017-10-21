class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :capacity, :quantity

  belongs_to :farm
  has_many :animals
end
