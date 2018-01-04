require 'dm-postgres-adapter'
require 'data_mapper'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :check_in, Date
  property :check_out, Date

end
