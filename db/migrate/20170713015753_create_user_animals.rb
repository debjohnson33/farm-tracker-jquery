class CreateUserAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :user_animals do |t|
      t.integer :user_id
      t.integer :animal_id

      t.timestamps
    end
  end
end
