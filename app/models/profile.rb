class Profile < ActiveRecord::Base
  belongs_to :user

  before_create :randomize_file_name
  before_update :randomize_file_name
  
  has_attached_file :picture, 
                    :styles => { :medium => "117x117>", :thumb => "32x32>" },
                    :default_url => '/assets/missing.png',
                    :url=>"/system/:class_images/:basename_:style.:extension"
                    
  validates :first_name,  :presence => true,
                         :length   => { :maximum => 50 }

  validates :last_name,  :presence => true,
                        :length   => { :maximum => 50 }
  
  def randomize_file_name
    if !picture_file_name.blank?
      extension = File.extname(picture_file_name).downcase
      self.picture.instance_write(:file_name, "#{SecureRandom.hex(16)}#{extension}")
    end
  end
                
end
