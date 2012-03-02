class AddMostCheckinedItemToVenueProducts < ActiveRecord::Migration
  def change
    add_column :venue_products, :most_checkined_item, :integer
    add_column :venue_products, :last_checkined_item, :integer
    add_column :venue_products, :verified_item, :integer
    
    remove_column :venue_products, :most_checkin_price
    remove_column :venue_products, :last_checkin_price
    remove_column :venue_products, :price

  end
end
