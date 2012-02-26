class Venue < ActiveRecord::Base
   has_many :checkins, :through=> :items
   has_many :items
end
