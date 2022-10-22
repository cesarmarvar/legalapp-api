class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :username
      t.integer :phone_number
      t.string :email
      t.string :title
      t.text :situation
      t.references :speciality, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
