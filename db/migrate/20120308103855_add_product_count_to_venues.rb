class AddProductCountToVenues < ActiveRecord::Migration
  def change
    change_column_default(:venues, :product_count, 0)
  end
end
