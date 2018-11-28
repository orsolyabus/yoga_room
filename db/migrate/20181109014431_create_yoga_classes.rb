class CreateYogaClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :yoga_classes do |t|
      
      t.string :title
      t.text :description
      t.integer :duration    
              
      t.timestamps      
    end
  end
end
