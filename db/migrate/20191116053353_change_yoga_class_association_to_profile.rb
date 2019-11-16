class ChangeYogaClassAssociationToProfile < ActiveRecord::Migration[5.2]
  def change
    remove_reference :yoga_classes, :user
    add_reference :yoga_classes, :profile, foreign_key: true
  end
end
