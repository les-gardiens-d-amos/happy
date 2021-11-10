class AddConnectedAtForUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :connected_at, :datetime, default: Time.zone.now
  end
end
