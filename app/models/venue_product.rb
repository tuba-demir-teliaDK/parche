include ApplicationHelper
class VenueProduct < ActiveRecord::Base
  belongs_to :product
  has_many :items  
  has_many :checkins, :through => :items  
   
  validates_presence_of :product
  validates_uniqueness_of :product_id, :scope => [:fs_venue_id]
  
  
  #default_scope order("created_at ASC")
  attr_accessor :most_checkined_item, :last_checkined_item, :venue_name
  
  def venue_name
    get_venue_name(self.fs_venue_id)
  end
  
   
  def verified_item
   Item.find(self.verified_item_id) if !self.verified_item_id.nil?
  end
 
  def most_checkined_item
     self.items.order('checkin_count desc').first
   #Item.find(self.most_checkined_item_id) if !self.most_checkined_item_id.nil?
  end
   
  def last_checkined_item
    Item.find(self.last_checkined_item_id) if !self.last_checkined_item_id.nil?    
    #self.items.all(:joins => :checkins, :select => "items.*, max(checkins.created_at)").first
  end
  
  class << self
    #def by_product(product)
    # self.where("product_id = ?", product.id)
    #end
  end
  
end