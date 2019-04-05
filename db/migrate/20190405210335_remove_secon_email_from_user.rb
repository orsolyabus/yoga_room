class RemoveSeconEmailFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :second_email, :string
  end
end
