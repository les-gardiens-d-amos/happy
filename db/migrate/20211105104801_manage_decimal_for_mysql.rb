class ManageDecimalForMysql < ActiveRecord::Migration[6.1]
  def change
    change_column :catches, :lat, :decimal, :precision => 10, :scale => 10
    change_column :catches, :long, :decimal, :precision => 10, :scale => 10
    change_column :catches, :altitude, :decimal, :precision => 10, :scale => 10
    change_column :catches, :accuracy, :decimal, :precision => 10, :scale => 10
  end
end
