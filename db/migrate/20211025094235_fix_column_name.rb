class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :amos, :type, :amos_type
    add_column :amos, :image_path, :string
  end
end
