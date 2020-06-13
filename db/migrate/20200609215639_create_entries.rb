class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t| #t is a placeholder for our table
      t.integer :list_id
      t.integer :book_id
      t.string :notes
    end
  end
end
