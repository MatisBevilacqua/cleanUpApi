class AddProfileIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :profile_id, :integer
    add_index :comments, :profile_id
  end
end
