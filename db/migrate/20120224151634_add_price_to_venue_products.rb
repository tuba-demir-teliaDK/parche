class AddPriceToVenueProducts < ActiveRecord::Migration
  def change
    add_column :venue_products, :price, :decimal
  end
end
