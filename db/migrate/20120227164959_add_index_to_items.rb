class AddIndexToItems < ActiveRecord::Migration
  def change
    add_index :items, [:venue_product_id,:price], :unique => true
  end
end
