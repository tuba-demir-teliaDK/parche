class Item < ActiveRecord::Base
  has_many :checkins
  belongs_to :venue_product
  
  validates_presence_of :venue_product
end
