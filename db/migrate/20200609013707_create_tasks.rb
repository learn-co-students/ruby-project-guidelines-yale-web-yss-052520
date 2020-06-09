class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :type, :name
      t.datetime :due_date, :assigned_date
    end
  end
end
