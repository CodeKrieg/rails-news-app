class User < ActiveRecord::Base
  has_secure_password
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, presence: true, length: { minimum: 6, maximum: 50}
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, 
  format: { with: VALID_EMAIL_REGEX }
  
  before_save { self.email = email.downcase }
  has_many :articles
  
end