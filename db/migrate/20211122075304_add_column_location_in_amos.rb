class AddColumnLocationInAmos < ActiveRecord::Migration[6.1]
  def change
    add_column :amos, :location, :string
  end
end
