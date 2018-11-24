class AddYogaClassReferenceToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_reference :schedules, :yoga_class, foreign_key: true
  end
end
