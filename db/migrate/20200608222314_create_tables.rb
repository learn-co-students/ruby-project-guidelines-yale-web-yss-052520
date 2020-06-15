# I've already run this migration, which created tables in our database to store players and boards permanently.

class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t| # players table
      # name as a string
      t.string :name

      # number of wins as an integer, defaults to 0 upon initialization
      t.integer :win_count, :default => 0
    end

    create_table :boards do |t| # boards table

      # representing current board configuration
      t.string :content, :default => $CHECKERBOARD_INITIAL
      # stores left player instance id
      t.integer :l_player_id
      # stores right player instance id
      t.integer :r_player_id
      # stores whose turn it is, “l” or “r”, defaults to left upon initialization
      t.string :player_turn, :default => "l"
      # if people are saving their games to come back to them, I thought addnig a timestamp would be helpful
      t.timestamps

    end
  end
end
