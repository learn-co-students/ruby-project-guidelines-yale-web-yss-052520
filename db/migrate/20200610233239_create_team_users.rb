class CreateTeamUsers < ActiveRecord::Migration[6.0]
  def change
    #joiner class for team and user
    create_table :team_users do |t|
      t.integer :user_id, :team_id
    end
  end
end
