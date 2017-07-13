class AddColumnToBabyAnimals < ActiveRecord::Migration[5.1]
  def change
    add_column :baby_animals, :animal_type, :string
  end
end
