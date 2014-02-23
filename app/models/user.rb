class User < ActiveRecord::Base

  has_and_belongs_to_many :roles

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

  has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200#" }, :default_url => "/assets/images/missing_avatar.png"

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  def role?(role)
    !!self.roles.find_by_name(role.to_s.camelize)
  end

  def self.admin?(user)
    user.role? :admin
  end

  def self.user?(user)
    user.role? :user
  end

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
  def self.create_admin(user)
    user.roles << Role.find_by_name(:admin)
  end

  def self.create_user
    self.roles << Role.find_by_name(:user)
  end

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end