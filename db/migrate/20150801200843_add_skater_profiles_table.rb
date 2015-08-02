class AddSkaterProfilesTable < ActiveRecord::Migration
  def change
    create_table :skater_profiles do |t|
      t.integer :skater_id
      t.string :first_name, default: '', null: false
      t.string :last_name, default: '', null: false
      t.string :avatar_file_path, default: '', null: false
      t.timestamps
    end
  end
end
