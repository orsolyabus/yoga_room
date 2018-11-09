class CreateYogaClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :yoga_classes do |t|

      t.timestamps
    end
  end
end
