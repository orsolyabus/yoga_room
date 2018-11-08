class ChangeUserTypeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_type, :string
    add_column :users, :is_teacher, :boolean, default: false
  end
end
