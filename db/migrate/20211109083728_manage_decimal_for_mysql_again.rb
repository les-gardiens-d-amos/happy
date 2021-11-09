class ManageDecimalForMysqlAgain < ActiveRecord::Migration[6.1]
  def change
    change_column :catches, :lat, :decimal, precision: 11, scale: 7
    change_column :catches, :long, :decimal, precision: 11, scale: 7
    change_column :catches, :altitude, :decimal, precision: 11, scale: 7
    change_column :catches, :accuracy, :decimal, precision: 11, scale: 7
  end
end
