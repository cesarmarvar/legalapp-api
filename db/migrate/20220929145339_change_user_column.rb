class ChangeUserColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :username
  end
end
