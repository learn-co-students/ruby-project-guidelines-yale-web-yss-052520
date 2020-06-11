class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :team_to_dos, :due_date, :date
  end
end
