class Checkin < ActiveRecord::Base
  belongs_to    :item
  belongs_to    :user
  belongs_to    :venue_product 
  has_many      :comments
  
  accepts_nested_attributes_for :comments

  validates_presence_of :item
end
