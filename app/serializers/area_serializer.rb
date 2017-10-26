class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :area_type, :capacity, :quantity, :availability

  belongs_to :farm
  has_many :animals
end
