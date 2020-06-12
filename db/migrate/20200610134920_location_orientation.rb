class LocationOrientation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :north_location, :integer
    add_column :locations, :south_location, :integer
    add_column :locations, :east_location, :integer
    add_column :locations, :west_location, :integer 
  end
end
