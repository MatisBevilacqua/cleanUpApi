class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :id_send
      t.string :id_receive
      t.string :message
    end
  end
end
