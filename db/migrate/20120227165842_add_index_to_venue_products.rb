class AddIndexToVenueProducts < ActiveRecord::Migration
  def change
    add_index :venue_products, [:venue_id,:product_id], :unique => true
  end
end
