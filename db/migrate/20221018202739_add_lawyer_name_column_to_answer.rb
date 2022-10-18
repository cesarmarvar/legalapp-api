class AddLawyerNameColumnToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :lawyer_name, :string
  end
end
