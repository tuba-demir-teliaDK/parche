class Checkin < ActiveRecord::Base
  belongs_to    :item
  belongs_to    :users
  
  validates_presence_of :item
end
