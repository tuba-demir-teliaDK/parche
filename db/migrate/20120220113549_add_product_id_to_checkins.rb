class AddProductIdToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :venue_id, :integer
    add_column :checkins, :product_id, :integer
    add_column :checkins, :user_id, :integer
  end
end
