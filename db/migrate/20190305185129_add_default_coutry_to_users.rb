class AddDefaultCoutryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :default_country, :string
  end
end
