class AddColumnImageIdToAmos < ActiveRecord::Migration[6.1]
  def change
    add_column :amos, :image_id, :string
  end
end
