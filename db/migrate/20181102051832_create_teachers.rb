class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :introduction
      t.string :spiritual_name
      t.string :image_url
      t.string :webpage_url
      t.string :phone
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.boolean :public_contact, default: false
      t.datetime :last_login
      t.timestamps
    end
  end
end
