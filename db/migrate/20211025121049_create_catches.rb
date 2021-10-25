class CreateCatches < ActiveRecord::Migration[6.1]
  def change
    create_table :catches do |t|
      t.integer :long
      t.integer :lat
      t.integer :altitude
      t.integer :accuracy

      t.timestamps
    end
  end
end
