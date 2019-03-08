class AddRegionToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :region, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
    remove_column :locations, :state, :string
  end
end
