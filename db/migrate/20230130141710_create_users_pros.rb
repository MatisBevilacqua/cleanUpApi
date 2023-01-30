class CreateUsersPros < ActiveRecord::Migration[7.0]
  def change
    create_table :users_pros do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
    end
  end
end
