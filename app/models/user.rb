require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, format: :email_address, :required => true
  property :password, BCryptHash, :required => true

  validates_confirmation_of :password
end
