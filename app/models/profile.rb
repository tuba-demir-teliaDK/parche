class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :picture, :styles=>{:medium =>["250x250>", :jpg], :thumb => ["100x100>", :jpg]}
  validates :first_name,  :presence => true,
                         :length   => { :maximum => 50 }

  validates :last_name,  :presence => true,
                        :length   => { :maximum => 50 }
end
