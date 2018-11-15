class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :duration
      t.datetime :start
      t.datetime :end
      t.integer :class_type
      t.timestamps
    end
  end
end
