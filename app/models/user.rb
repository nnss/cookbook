class User < ActiveRecord::Base
  attr_accessible :mail, :name, :password


  attr_accessor :password
  #before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :mail
  validates_uniqueness_of :mail,:name
  
  def self.authenticate(mail, password)
    user = find_by_mail(mail)
    if user && user[:password] == password
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      #self.password_salt = BCrypt::Engine.generate_salt
      #self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end