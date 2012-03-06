class AddIndexToFriendships < ActiveRecord::Migration
  def change
    add_index :friendships, [:user_id,:friend_id,:status], :unique => true
  end
end
