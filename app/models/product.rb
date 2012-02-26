class Product < ActiveRecord::Base
  has_many :checkins, :through=> :assets
  has_many :venue_products
  has_many :assets
end
