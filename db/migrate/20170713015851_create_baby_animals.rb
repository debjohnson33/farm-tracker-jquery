class CreateBabyAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :baby_animals do |t|
      t.string :name
      t.string :age
      t.string :sex
      t.string :color
      t.integer :weight
      t.integer :animal_id
      t.timestamps
    end
  end
end
