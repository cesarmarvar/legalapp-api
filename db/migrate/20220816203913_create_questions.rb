class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.text :explanation
      t.references :user, null: false, foreign_key: true
      t.references :lawyer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
