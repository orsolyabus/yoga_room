class AddSecondEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :second_email, :string, default: "orsidoestest@gmail.com"
  end
end
