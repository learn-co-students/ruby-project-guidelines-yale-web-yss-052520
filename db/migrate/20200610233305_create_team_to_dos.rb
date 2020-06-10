class CreateTeamToDos < ActiveRecord::Migration[6.0]
  def change
    create_table do |t|
      t.integer :team_id, :user_id
      t.string :name
      t.boolean :complete?
      t.datetime :due_date
    end
  end
end
