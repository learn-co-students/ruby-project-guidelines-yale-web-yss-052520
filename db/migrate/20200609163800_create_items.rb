class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :description 
      t.integer :location_id
      t.integer :player_id
    end
  end
end