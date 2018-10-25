class AddUserToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :user_id, :intege
  end
end
