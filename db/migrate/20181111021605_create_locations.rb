class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :city
      t.string :address
      t.string :studio

      t.timestamps
    end
  end
end
