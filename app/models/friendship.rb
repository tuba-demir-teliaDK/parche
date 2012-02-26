class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'
  
  validates_presence_of :user
  validates_presence_of :friend
end
