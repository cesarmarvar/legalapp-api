class RemoveLawyerFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :questions, :lawyer, null: false, foreign_key: true
  end
end
