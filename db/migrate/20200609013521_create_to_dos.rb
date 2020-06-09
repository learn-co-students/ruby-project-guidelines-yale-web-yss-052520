class CreateToDos < ActiveRecord::Migration[6.0]
  def change
    create_table :to_dos do |t|
      t.integer :user_id, :task_id
      t.boolean :complete?
      t.integer :priority_level
    end
  end
end
