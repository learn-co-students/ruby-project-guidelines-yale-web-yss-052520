class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t| #t is a placeholder for our table
      t.string :title
      t.integer :author_id
      t.string :genre
      t.integer :year
      t.string :link
      t.string :format
      t.string :notes
      t.boolean :read, default: false
    end
  end
end
