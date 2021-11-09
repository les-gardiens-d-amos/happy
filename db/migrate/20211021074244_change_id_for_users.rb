class ChangeIdForUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :id, :string, limit: 36, primary: true
  end
end
