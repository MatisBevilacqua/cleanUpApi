class AddRankingsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :ranking, :integer
  end
end
