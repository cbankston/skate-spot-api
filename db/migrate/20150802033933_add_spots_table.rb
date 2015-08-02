class AddSpotsTable < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.integer :skater_id
      t.integer :lat
      t.integer :long
      t.string :name, default: '', null: false
      t.timestamps
    end
  end
end
