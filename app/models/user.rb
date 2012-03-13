class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable,
         :validatable,:token_authenticatable,  :timeoutable #, :confirmable
  
  def ensure_authentication_token!   
    reset_authentication_token! if authentication_token.blank?   
  end 

  before_save :ensure_authentication_token!   
  # Setup accessible (or protected) attributes for your model
  attr_accessible :id, :email, :password, :password_confirmation, :remember_me, :authentication_token
  
  attr_protected :roles_mask
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
     
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  #relations    
  has_one  :profile  
  has_many :checkins
  has_many :items, :through => :items
  has_many :comments
  
  accepts_nested_attributes_for :profile
  
  #friendship relations
  #0-requested,1-pending,2-accepted          
  has_many :friends, :through => :friendships, :conditions => "status = 2"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 0", :order => :created_at
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 1", :order => :created_at
  has_many :friendships, :dependent => :destroy  
  
  #authorizations
  ROLES = %w[admin moderator author banned]
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
  def as_json(options)
    super(:only => [:id])
  end
  
end
