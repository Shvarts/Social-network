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
            :length => {:within => 6..40}

  has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200#" }, :default_url => "/assets/images/missing_avatar.png"

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end