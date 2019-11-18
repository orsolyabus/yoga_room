class ChangeLicationAssociationFromUserToProfile < ActiveRecord::Migration[5.2]
  def change
    remove_reference :locations, :created_by
    add_reference :locations, :profile, foreign_key: true
  end
end
