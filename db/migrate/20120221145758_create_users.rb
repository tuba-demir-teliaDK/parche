class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email,:unique => true
      t.string :phone
      t.string :city
      t.string :password

      t.timestamps
    end
  end
end
