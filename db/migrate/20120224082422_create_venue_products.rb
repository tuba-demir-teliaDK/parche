class CreateVenueProducts < ActiveRecord::Migration
  def change
    create_table :venue_products do |t|
      t.string :venue_id
      t.integer :product_id

      t.timestamps
    end
  end
end
