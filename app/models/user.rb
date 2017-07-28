require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, BCryptHash, :required => true

end
