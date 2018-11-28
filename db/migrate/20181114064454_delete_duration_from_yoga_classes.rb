class DeleteDurationFromYogaClasses < ActiveRecord::Migration[5.2]
  def change
    remove_column :yoga_classes, :duration, :integer
  end
end
