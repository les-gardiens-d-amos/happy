class AddColumnCatches < ActiveRecord::Migration[6.1]
  def change
    add_column :catches, :amos_id, :string
  end
end
