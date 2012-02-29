class VenueProduct < ActiveRecord::Base
  belongs_to :product
  has_many :items
  
  has_many :checkins, :through => :items 
  
  validates_presence_of :product
  
  #scope :most_checkin_price
  
  #default_scope order("created_at ASC")
  
  def most_checkined_item
    
    puts 'sad'
    self.items.order('checkin_count desc').first
   
  end
  
  class << self
    def by_product(product)
      self.where("product_id = ?", product.id)
    end
  end
  
end
