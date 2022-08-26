class ChangeColumnNullUserLawyer < ActiveRecord::Migration[7.0]
  def change
    change_column_null :lawyers, :user_id, false
  end
end
