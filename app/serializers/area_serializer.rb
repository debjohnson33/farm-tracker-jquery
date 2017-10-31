class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :area_type, :capacity, :quantity, :availability, :farm_id

  belongs_to :farm
  has_many :animals
end
