class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :venue_product_id
      t.decimal :price

      t.timestamps
    end
  end
end
