class MoveLastLoginFromInfosToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :infos, :last_login, :datetime
    add_column :users, :last_login, :datetime
  end
end
