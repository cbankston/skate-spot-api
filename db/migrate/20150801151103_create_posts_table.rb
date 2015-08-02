class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :caption, default: '', null: false
      t.integer :lat
      t.integer :long
      t.string :file_path, default: '', null: false
      t.string :url, default: '', null: false
      t.integer :skater_id
      t.integer :up_vote_count
      t.integer :down_vote_count
      t.timestamps
    end
  end
end
