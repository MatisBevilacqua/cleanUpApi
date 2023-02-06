class AddCommentCountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :comment_count, :integer
  end
end
