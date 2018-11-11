class AddLocationReferencesToYogaClass < ActiveRecord::Migration[5.2]
  def change
    add_reference :yoga_classes, :location, foreign_key: true
    add_reference :yoga_classes, :time_slot, foreign_key: true
  end
end
