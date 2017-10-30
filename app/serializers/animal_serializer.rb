class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :sex, :color, :animal_type, :weight, :pregnant, :date_bred, :estimated_due_date, :area_id, :area

  belongs_to :area
end
