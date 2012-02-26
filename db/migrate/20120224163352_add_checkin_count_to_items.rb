class AddCheckinCountToItems < ActiveRecord::Migration
  def change
    add_column :items, :checkin_count, :integer
  end
end
