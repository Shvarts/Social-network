class User < ActiveRecord::Base 
    before_create { generate_token(:EmailToken) }

	validates :firstname, :presence => true,
			 			  :length => {:in => 2..20}

	validates :lastname,  :presence => true,
						  :length => {:in => 2..20}

	validates :email,	  :presence => true,
						  :length => {:in => 2..250},
						  :uniqueness => true,
						  :format => {:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

	validates :password,  :presence => true,
						  :length => {:within => 6..40}

	has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200#" }, :default_url => "/assets/images/missing_avatar.png"
	
def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

end