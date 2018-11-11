class AddYogaClassaReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :yoga_classes, :user, as: :teacher, foreign_key: true
  end
end
