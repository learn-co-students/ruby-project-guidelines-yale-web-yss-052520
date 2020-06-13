class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t| #t is a placeholder for our table
      t.string :name
      t.string :description
    end
  end
end
