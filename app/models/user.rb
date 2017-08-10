class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :username, :password, :password_confirmation

  validates_uniqueness_of :email
  has_many :answers
  has_many :questions
end
