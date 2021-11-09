class ModifyColumnIdAmos < ActiveRecord::Migration[6.1]
  def change
    change_column :amos, :id, :string, limit: 36, primary: true
  end
end
