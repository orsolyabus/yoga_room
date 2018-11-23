class AddUserReferenceToYogaClasses < ActiveRecord::Migration[5.2]
  def change
    add_reference :yoga_classes, :user, foreign_key: true
  end
end
