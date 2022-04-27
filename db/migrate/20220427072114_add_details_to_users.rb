class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :nickname, unique: true
    change_column_null :users, :nickname, false
  end
end
