include ApplicationHelper
class VenueProduct < ActiveRecord::Base
  belongs_to :product
  has_many :items 
  has_many :checkins, :through => :items  
  
  belongs_to :verified_item,  :class_name => 'Item', :foreign_key => 'verified_item_id'
  belongs_to :last_checkined_item,  :class_name => 'Item', :foreign_key => 'last_checkined_item_id'  
  #TODO: most checkined item batch'le update edildiğinde bu kısım aktif edilecek 
  #belongs_to :most_checkined_item,  :class_name => 'Item', :foreign_key => 'most_checkined_item_id'
  
  validates_presence_of :product
  validates_uniqueness_of :product_id, :scope => [:fs_venue_id]
  
  attr_accessor :venue_name
  
  def venue_name
    get_venue_name(self.fs_venue_id)
  end
  
  def most_checkined_item
     items.sorted.first
  end
  
  def verified
    if !self.verified_item.nil?
      self.verified_item
    else
      self.most_checkined_item
    end
  end
   
  # def verified_item
    # items.
   # Item.find(self.verified_item_id) if !self.verified_item_id.nil?
  # end
#  
  # def most_checkined_item
     # self.items.order('checkin_count desc').first
   # #Item.find(self.most_checkined_item_id) if !self.most_checkined_item_id.nil?
  # end
#    
  # def last_checkined_item
    # Item.find(self.last_checkined_item_id) if !self.last_checkined_item_id.nil?    
    # #self.items.all(:joins => :checkins, :select => "items.*, max(checkins.created_at)").first
  # end
  
  class << self
    #def by_product(product)
    # self.where("product_id = ?", product.id)
    #end
  end
  
end