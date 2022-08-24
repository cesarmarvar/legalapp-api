class AddIndexToTokenEmailOnUser < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :token, unique: true
    add_index :users, :email, unique: true
  end
end
