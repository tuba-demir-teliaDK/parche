class Asset
  include ActiveModel::Validations
  include ActiveModel::Serialization
  
  belongs_to :product
 
  validates_presence_of :product_id
 
  attr_accessor :product_name, :last_checkin_price, :most_checkin_price, :venue_name
  
  def initialize(product_id) 
    @product=Product.find(:product_id)
    product_name = @product.name    
  end
  
  
end