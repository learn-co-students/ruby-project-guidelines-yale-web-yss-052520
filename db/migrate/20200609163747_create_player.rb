class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :bag_count
      t.integer :location_id
    end
  end
end
