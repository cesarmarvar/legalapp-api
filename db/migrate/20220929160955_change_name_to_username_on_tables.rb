class ChangeNameToUsernameOnTables < ActiveRecord::Migration[7.0]
  def change
    rename_column :lawyers, :name, :lawyer_name
    rename_column :reviews, :name, :reviewer_name
  end
end
