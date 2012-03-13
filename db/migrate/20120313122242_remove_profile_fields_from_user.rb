class RemoveProfileFieldsFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :firstName
    remove_column :users, :lastName
    remove_column :users, :gender
    remove_column :users, :city
  end

  def down
  end
end
