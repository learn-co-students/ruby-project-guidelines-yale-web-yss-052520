class CreateOfficials < ActiveRecord::Migration[5.2]
  def change 
      create_table :officials do |t|
          t.string :name
          t.string :location
          t.string :email
          t.string :role
      end 
  end 
end 