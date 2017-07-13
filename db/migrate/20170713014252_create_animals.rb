class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :age
      t.string :sex
      t.string :color
      t.integer :weight
      t.boolean :pregnant, :default => false
      t.date :date_bred
      t.date :estimated_due_date
      t.integer :area_id
      t.timestamps
    end
  end
end
