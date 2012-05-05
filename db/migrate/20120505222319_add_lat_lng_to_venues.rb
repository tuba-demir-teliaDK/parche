class AddLatLngToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :lat, :decimal, :precision => 19, :scale => 15
    add_column :venues, :lng, :decimal, :precision => 19, :scale => 15
    add_index  :venues, [:lat,:lng]
  end
end
