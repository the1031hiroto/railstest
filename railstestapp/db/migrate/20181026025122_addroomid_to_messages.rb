class AddroomidToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :room_id, :intege
  end
end
