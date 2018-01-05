require 'dm-postgres-adapter'
require 'dm-validations'
require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, unique: true
  property :name, String, required: true
  property :secure_password, Text

  has n, :places


  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.secure_password = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user && BCrypt::Password.new(user.secure_password) == password ? user : nil
  end
end
