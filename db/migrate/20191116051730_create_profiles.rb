class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.boolean :is_teacher
      t.string :image_url
      t.text :intro
      t.string :web
      t.string :phone
      t.string :contact
      t.boolean :public_contact
      t.datetime :last_login
      
      t.timestamps
    end
  end
end
