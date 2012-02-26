class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :description
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
