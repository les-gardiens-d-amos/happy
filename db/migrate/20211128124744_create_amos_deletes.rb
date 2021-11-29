class CreateAmosDeletes < ActiveRecord::Migration[6.1]
  def change
    create_table :amos_deletes do |t|
      t.integer :animals_id
      t.string :species
      t.string :amos_type
      t.string :name
      t.integer :level
      t.string :location
      t.timestamps
    end
  end
end
