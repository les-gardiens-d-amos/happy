class CreateAmos < ActiveRecord::Migration[6.1]
  def change
    create_table :amos do |t|
      t.string :user_id
      t.integer :animals_id
      t.string :species
      t.string :type
      t.string :name
      t.integer :level, :default => 1
      t.timestamps
    end
  end
end
