class AddUserRefToLawyer < ActiveRecord::Migration[7.0]
  def change
    add_reference :lawyers, :user, foreign_key: true
  end
end
