class AddColumnToAnimals < ActiveRecord::Migration[5.1]
  def change
    add_column :animals, :animal_type, :string
  end
end
