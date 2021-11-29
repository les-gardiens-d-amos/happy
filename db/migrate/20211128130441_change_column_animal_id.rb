class ChangeColumnAnimalId < ActiveRecord::Migration[6.1]
  def change
    rename_column :amos_deletes, :animals_id, :animal_id
  end
end
