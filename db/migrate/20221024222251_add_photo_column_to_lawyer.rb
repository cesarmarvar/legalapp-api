class AddPhotoColumnToLawyer < ActiveRecord::Migration[7.0]
  def change
    add_column :lawyers, :image, :string
  end
end
