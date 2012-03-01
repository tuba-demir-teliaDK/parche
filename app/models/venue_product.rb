class VenueProduct < ActiveRecord::Base
  belongs_to :product
  has_many :items  
  has_many :checkins, :through => :items   
  validates_presence_of :product
  
  #default_scope order("created_at ASC")
  attr_accessor :most_checkined_item, :last_checkined_item, :venue_name
  
  def venue_name
    get_venue_name(self.venue_id)
  end
  
  def most_checkined_item
    self.items.order('checkin_count desc').first
  end
  
  def last_checkined_item
    self.items.all(:joins => :checkins, :select => "items.*, max(checkins.created_at)").first
  end
  
  class << self
    #def by_product(product)
    # self.where("product_id = ?", product.id)
    #end
  end
  
end