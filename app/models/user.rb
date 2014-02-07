class User < ActiveRecord::Base 
	validates :firstname, :presence => true,
			 			  :length => {:in => 2..20}

	validates :lastname,  :presence => true,
						  :length => {:in => 2..20}

	validates :email,	  :presence => true,
						  :length => {:in => 2..250},
						  :uniqueness => true,
						  :format => {:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

	validates :password,  :presence => true,
						  :length => {:within => 6..40},
						  :confirmation =>true
						  
	validates_confirmation_of :password, message: "Your password and its checking must be identical"

	has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200#" }, :default_url => "/assets/images/missing_avatar.png"
end