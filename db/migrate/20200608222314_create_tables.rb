class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :win_count
    end

    create_table :boards do |t|
      t.timestamps
    end
  end
end
