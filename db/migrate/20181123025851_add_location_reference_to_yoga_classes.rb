class AddLocationReferenceToYogaClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :yoga_classes, :location, foreign_key: true
  end
end
