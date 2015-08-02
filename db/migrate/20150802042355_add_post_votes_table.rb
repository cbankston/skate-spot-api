class AddPostVotesTable < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :skater_id
      t.integer :post_id
      t.string :direction, default: '', null: false
      t.timestamps
    end
  end
end
