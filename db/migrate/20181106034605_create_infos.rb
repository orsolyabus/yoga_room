class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.references :user, foreign_key: true
      t.string :spiritual_name
      t.string :image_url
      t.string :webpage
      t.text :introduction
      t.string :phone
      t.boolean :public_contact
      t.datetime :last_login

      t.timestamps
    end
  end
end
