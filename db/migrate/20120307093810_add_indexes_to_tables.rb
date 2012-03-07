class AddIndexesToTables < ActiveRecord::Migration
  def change
    add_index :checkins, :user_id
    add_index :checkins, :item_id
    add_index :items, :venue_product_id
    add_index :products, :name
    add_index :products, :description
    add_column :venues, :product_count, :integer
    add_column :venues, :fs_venue_id, :string
    add_index :venues, :fs_venue_id
    remove_column :venues, :description
    remove_column :venues, :phone
    remove_column :venues, :email
    remove_column :venues, :address
  end
end
