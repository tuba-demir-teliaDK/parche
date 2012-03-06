class ChangeDataTypeForFriendships < ActiveRecord::Migration
  def up
    change_column :friendships, :status ,:integer
  end

  def down
  end
end
