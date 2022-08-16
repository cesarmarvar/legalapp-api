class CreateLawyers < ActiveRecord::Migration[7.0]
  def change
    create_table :lawyers do |t|
      t.string :name
      t.integer :years_licensed
      t.text :bio
      t.string :credentials
      t.string :payment_method
      t.string :social_media
      t.string :state_location
      t.string :office_address
      t.integer :office_phone
      t.integer :cellphone
      t.string :email
      t.integer :lat
      t.integer :long

      t.timestamps
    end
  end
end
