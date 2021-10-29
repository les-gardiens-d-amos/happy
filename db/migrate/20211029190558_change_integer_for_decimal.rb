class ChangeIntegerForDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :catches, :lat, :decimal, :precision => 15, :scale => 13
    change_column :catches, :long, :decimal, :precision => 15, :scale => 13
    change_column :catches, :altitude, :decimal, :precision => 15, :scale => 13
    change_column :catches, :accuracy, :decimal, :precision => 15, :scale => 13
  end
end
