class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :amos, :animals_id, :animal_id
  end
end
