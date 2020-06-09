class AddAttrToBoard < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :red_player_id, :integer
    add_column :boards, :black_player_id, :integer
    add_column :boards, :player_turn, :integer
  end
end
