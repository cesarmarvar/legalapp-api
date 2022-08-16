class CreateLawyerSpecialities < ActiveRecord::Migration[7.0]
  def change
    create_table :lawyer_specialities do |t|
      t.references :lawyer, null: false, foreign_key: true
      t.references :speciality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
