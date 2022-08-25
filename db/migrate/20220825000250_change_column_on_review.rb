class ChangeColumnOnReview < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :user_id, :integer, null: true
  end
end
