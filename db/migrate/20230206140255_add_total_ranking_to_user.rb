class AddTotalRankingToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :total_ranking, :float
  end
end
