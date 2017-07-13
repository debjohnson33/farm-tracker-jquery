class AddColumnsToAreas < ActiveRecord::Migration[5.1]
  def change
  	add_column :areas, :area_type, :string
  	add_column :areas, :capacity, :integer
  	add_column :areas, :quantity, :integer
  end
end
