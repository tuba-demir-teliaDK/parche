class CreateUserFollowups < ActiveRecord::Migration
  def change
    create_table :user_followups do |t|
      t.integer :user_id
      t.string :fs_venue_id
      t.integer :category_id
      t.integer :product_id
      t.boolean :active

      t.timestamps
    end
  end
end
