class Item < ActiveRecord::Base
  has_many :checkins
  belongs_to :venue_product
  
  validates_presence_of :venue_product
  validates_uniqueness_of :venue_product_id, :scope => [:price]
  
end
