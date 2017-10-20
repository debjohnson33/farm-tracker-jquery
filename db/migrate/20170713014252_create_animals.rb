class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :age
      t.string :sex
      t.string :color
      t.string :animal_type
      t.integer :weight
      t.boolean :pregnant, :default => false
      t.datetime :date_bred, :null => false
      t.datetime :estimated_due_date, :null => false
      t.integer :area_id
      t.timestamps

    end
  end
end
