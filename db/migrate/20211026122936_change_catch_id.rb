class ChangeCatchId < ActiveRecord::Migration[6.1]
  def change
    change_column :catches, :id, :string, :limit => 36, :primary => true
  end
end
