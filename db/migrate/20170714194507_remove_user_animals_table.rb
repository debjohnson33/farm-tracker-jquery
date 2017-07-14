class RemoveUserAnimalsTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :user_animals
  end
end
