class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :name
      t.integer :farm_id
      t.string :area_type
      t.integer :capacity
      t.integer :quantity

      t.timestamps
    end
  end
end
