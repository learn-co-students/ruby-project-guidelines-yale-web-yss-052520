# I've already run this migration, which created tables in our database to store players and boards permanently.

class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t| # players table
      # name as a string
      t.string :name

      # number of wins as an integer
      t.integer :win_count
    end

    create_table :boards do |t| # boards table

      # representing current board configuration
      t.string :content 
      # stores upper_player instance id
      t.integer :upper_player_id
      # stores lower_player instance id
      t.integer :lower_player_id
      # stores whose turn it is, “upper” or “lower”
      t.string :player_turn
      # if people are saving their games to come back to them, I thought addnig a timestamp would be helpful
      t.timestamps

    end
  end
end
