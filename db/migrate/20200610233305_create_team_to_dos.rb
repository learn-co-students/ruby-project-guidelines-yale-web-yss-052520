class CreateTeamToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :team_to_dos do |t|
      t.integer :team_id, :user_id
      t.string :name
      t.boolean :complete?
      t.datetime :due_date
    end
  end
end
