class AddUniqueIndexToVenueCategory < ActiveRecord::Migration
  def change
    add_index :venue_categories, :fs_category_id, :unique => true
  end
end
