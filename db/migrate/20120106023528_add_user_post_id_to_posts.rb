class AddUserPostIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_post_id, :integer
  end
end
