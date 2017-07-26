class CreateFarmBabyAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :farm_baby_animals do |t|
      t.integer :farm_id
      t.integer :baby_animal_id

      t.timestamps
    end
  end
end
