class ChangeBookTypeToFormat < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :type, :format
  end
end
