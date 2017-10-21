class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :sex, :color, :animal_type, :weight

  belongs_to :area
end
