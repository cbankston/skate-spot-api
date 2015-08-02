class AddSpotIdToPostsTable < ActiveRecord::Migration
  def up
    add_column :posts, :spot_id, :integer
  end

  def down
    remove_column :posts, :spot_id, :integer
  end
end
