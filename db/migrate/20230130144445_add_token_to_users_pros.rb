class AddTokenToUsersPros < ActiveRecord::Migration[7.0]
  def change
    add_column :users_pros, :token, :string
  end
end
