class CreateVenueCategories < ActiveRecord::Migration
  def change
    create_table :venue_categories do |t|
      t.string :fs_category_id
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
