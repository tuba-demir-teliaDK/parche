class User < ActiveRecord::Base
   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     
    validates :firstName,  :presence => true, 
                           :length   => { :maximum => 50 }  
                                        
    validates :lastName,  :presence => true, 
                          :length   => { :maximum => 50 }
                      
    validates :email, :presence => true,
                      :format   => { :with => email_regex },
                      :uniqueness => { :case_sensitive => false }
         
     
    has_many :checkins
    has_many :items, :through => :items           
    has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
    has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => :created_at
    has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => :created_at
    has_many :friendships, :dependent => :destroy
end
