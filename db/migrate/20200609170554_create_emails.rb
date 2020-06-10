class CreateEmails < ActiveRecord::Migration[5.2]
  def change 
      create_table :emails do |t|
          t.string :message
          t.string :subject
          t.string :link
          t.integer :user_id
          t.integer :official_id
      end 
  end 
end 