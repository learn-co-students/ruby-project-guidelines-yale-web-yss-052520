class RecreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :category, :name
      t.datetime :due_date, :assigned_date
    end
  end
end
