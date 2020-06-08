class AddInitialFourTables < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t| #t is a placeholder for our table
      t.string :name
      t.string :description
    end

    create_table :books do |t| #t is a placeholder for our table
      t.string :title
      t.integer :author_id
      t.string :genre
      t.integer :year
      t.string :link
      t.string :type
      t.string :notes
    end

    create_table :list_entries do |t| #t is a placeholder for our table
      t.integer :list_id
      t.integer :book_id
    end

    create_table :authors do |t| #t is a placeholder for our table
      t.string :first_name
      t.string :last_name
    end
  end
end
