class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.integer :active
      t.integer :display_order
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
