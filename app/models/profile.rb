class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name,  :presence => true,
                         :length   => { :maximum => 50 }

  validates :last_name,  :presence => true,
                        :length   => { :maximum => 50 }
end
