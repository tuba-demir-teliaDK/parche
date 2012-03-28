class AddActiveColumnToTables < ActiveRecord::Migration
  def change
    add_column :products, :active, :boolean, :default=> 1
    add_column :items, :active, :boolean, :default=> 1
    add_column :venue_products, :active, :boolean, :default=> 1
    remove_column :categories, :active
    add_column :categories, :active, :boolean, :default=> 1
    
  end
end
