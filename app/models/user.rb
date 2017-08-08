require 'bcrypt'

class User < ActiveRecord::Base
  has_many :answers
  has_many :questions
  has_secure_password

  # users.password_hash in the database is a :string
  include bcrypt

  def password
    @password ||= password.new(password_hash)
  end

  def password=(new_password)
    @password = password.create(new_password)
    self.password_hash = @password
  end

  # creating an account

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  # authenticating a user
  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to home_url
    end
  end
end
