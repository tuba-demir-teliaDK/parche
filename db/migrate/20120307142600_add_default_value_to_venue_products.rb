class AddDefaultValueToVenueProducts < ActiveRecord::Migration
  def change
    change_column_default(:venue_products, :checkin_count, 0)
    change_column_default(:items, :checkin_count, 0)
  end
end
