require 'dm-postgres-adapter'
require 'data_mapper'

class Place
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :address, Text
  property :price, Integer

  belongs_to :user

end
