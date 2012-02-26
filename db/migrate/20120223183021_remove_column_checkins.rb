class RemoveColumnCheckins < ActiveRecord::Migration
  def up
    remove_column :checkins, :venue_id, :product_id, :price
  end

  def down
  end
end
