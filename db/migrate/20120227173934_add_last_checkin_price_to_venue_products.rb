class AddLastCheckinPriceToVenueProducts < ActiveRecord::Migration
  def change
    add_column :venue_products, :last_checkin_price, :decimal
    add_column :venue_products, :most_checkin_price, :decimal
    add_column :venue_products, :checkin_count, :integer
  end
end
