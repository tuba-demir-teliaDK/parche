class AddParentToVenueCategory < ActiveRecord::Migration
  def change
    add_column :venue_categories, :parent_id, :integer
  end
end
