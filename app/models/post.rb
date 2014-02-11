class Post < ActiveRecord::Base
  validates :title, :presence => true, :length => { minimum: 2, :too_short => "To short" }
  validates :content, :presence => true, :length => { minimum: 2, :too_short => "To short"}
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :default_url => "missing_avatar.png"
end
