class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  has_many :answers
  has_many :questions
end
