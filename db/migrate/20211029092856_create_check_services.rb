class CreateCheckServices < ActiveRecord::Migration[6.1]
  def change
    create_table :check_services do |t|
      
      t.timestamps
    end
  end
end
