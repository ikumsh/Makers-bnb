require 'dm-postgres-adapter'
require 'data_mapper'

class Booking
  include DataMapper::Resource

  property :id, Serial
  property :check_in, Date
  property :check_out, Date

 belongs_to :place
 attr_reader :current_place

 def self.can_be_booked?(check_in, current_place_id)

   bookings = Booking.all.select do |booking|
     (Date.parse(check_in) == booking.check_in) && (current_place_id == booking.place_id)
   end
  check = bookings.first.check_in if bookings.first


   check != Date.parse(check_in)
 end

end
