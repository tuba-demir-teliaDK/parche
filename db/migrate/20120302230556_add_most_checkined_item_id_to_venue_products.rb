class AddMostCheckinedItemIdToVenueProducts < ActiveRecord::Migration
  def change    
    add_column :venue_products, :most_checkined_item_id, :integer
    add_column :venue_products, :last_checkined_item_id, :integer
    add_column :venue_products, :verified_item_id, :integer
  end
end
