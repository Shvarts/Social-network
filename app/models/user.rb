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

  validates_confirmation_of :password, message: "Your password and it's checking must be identical"

  has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200#" }, :default_url => "/assets/missing_avatar.png"

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  has_many :friendships
  has_many :friends,
           :through => :friendships,
           :conditions => "status = 'accepted'",
           :order => :firstname
  has_many :requested_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'requested'",
           :order => :created_at
  has_many :pending_friends,
           :through => :friendships,
           :source => :friend,
           :conditions => "status = 'pending'",
           :order => :created_at

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def authenticate(pass)
    password == pass

  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end