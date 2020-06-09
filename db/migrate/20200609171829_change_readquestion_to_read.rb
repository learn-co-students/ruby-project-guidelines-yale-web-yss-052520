class ChangeReadquestionToRead < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :read?, :read
  end
end
