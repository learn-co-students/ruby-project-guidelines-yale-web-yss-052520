class ChangeListEntriesToEntries < ActiveRecord::Migration[5.2]
  def change
    rename_table :list_entries, :entries
  end
end
