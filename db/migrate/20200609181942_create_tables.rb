class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.datetime :date
      t.integer :country_id
      t.integer :confirmed_cases
      t.integer :active_cases
      t.integer :death_cases
      t.integer :recovered_cases
    end

    create_table :countries do |t|
      t.string :name
    end

  end
end
