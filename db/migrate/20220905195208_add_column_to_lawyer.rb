class AddColumnToLawyer < ActiveRecord::Migration[7.0]
  def change
    add_column :lawyers, :reviews_count, :integer
    add_column :lawyers, :average_rating, :float, default: 0
  end
end
