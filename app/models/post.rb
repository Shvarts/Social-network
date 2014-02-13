class Post < ActiveRecord::Base
	validates :title, :presence => true, :length => { minimum: 2, :too_short => "To short" }
	validates :content, :presence => true, :length => { minimum: 2, :too_short => "To short"}
	has_attached_file :photo, :styles => { :small => "50x50>" },
                	  :default_url => "missing_avatar.png"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']                  
                    
end
