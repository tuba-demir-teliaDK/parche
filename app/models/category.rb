class Category < ActiveRecord::Base
  has_many :products, :through=> :category_product
end
