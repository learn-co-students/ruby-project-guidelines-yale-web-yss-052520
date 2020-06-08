class AddNotesToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :notes, :string
  end
end
