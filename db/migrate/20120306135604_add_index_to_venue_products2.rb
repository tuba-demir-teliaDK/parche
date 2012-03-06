class AddIndexToVenueProducts2 < ActiveRecord::Migration
  def change
    add_column :venue_products, :fs_venue_id, :string
    remove_index :venue_products, :name=> :index_venue_products_on_venue_id_and_product_id
    add_index :venue_products, [:fs_venue_id,:product_id], :unique => true
    add_index :venue_products, :venue_id
    add_index :venue_products, :product_id
    add_index :venue_products, :fs_venue_id
  end
end
