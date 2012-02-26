class VenueProduct < ActiveRecord::Base
  belongs_to :product
  has_many :items
  
  has_many :checkins, :through => :items
  
  validates_presence_of :product
end
