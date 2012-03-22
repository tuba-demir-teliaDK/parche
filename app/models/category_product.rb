class CategoryProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  
  validates_presence_of :product
  validates_presence_of :category
  validates_uniqueness_of :product_id, :scope => [:category_id]
end
