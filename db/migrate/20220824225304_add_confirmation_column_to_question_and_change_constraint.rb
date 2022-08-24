class AddConfirmationColumnToQuestionAndChangeConstraint < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :confirmation, :string
    change_column :questions, :user_id, :integer, null: true
  end
end
