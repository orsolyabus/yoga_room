class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :sender
      t.string :subject
      t.text :message
      t.boolean :solved, default: false
      t.timestamps
    end
  end
end
