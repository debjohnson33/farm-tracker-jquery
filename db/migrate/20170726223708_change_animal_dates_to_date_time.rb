class ChangeAnimalDatesToDateTime < ActiveRecord::Migration[5.1]
  def change
  	change_column :animals, :date_bred, :datetime
  	change_column :animals, :estimated_due_date, :datetime 
  end
end
