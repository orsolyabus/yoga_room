class CreateSavedSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_searches do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.json :params

      t.timestamps
    end
  end
end
