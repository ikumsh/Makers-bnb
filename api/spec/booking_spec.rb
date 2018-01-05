describe Booking do
  describe "check in and check out" do
    let(:booking) { Booking.create(check_in: '2018-01-04', check_out: '2018-01-07')}
    it 'returns the check in date' do
      expect(booking.check_in).to be_kind_of(Date)
    end

    it 'returns the check out date' do
      expect(booking.check_out).to be_kind_of(Date)
    end
  end

  describe "place availability" do
    it 'confirms non-availability of the place' do
      Booking.create(check_in: '2018-01-04', check_out: '2018-01-07', place_id: 1)
      expect(Booking.can_be_booked?('2018-01-04', 1)).to be(false)
    end
    it 'confirms availability of the place' do
      booking = Booking.all
      expect(booking.can_be_booked?('2018-01-04', 1)).to be(true)
    end
  end
end
