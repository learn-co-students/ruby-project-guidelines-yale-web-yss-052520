class ChangeColumnAgain < ActiveRecord::Migration[6.0]
  def change
    change_column :team_to_dos, :due_date, :string
  end
end
