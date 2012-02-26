class AddItemIdToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :item_id, :integer
  end
end
