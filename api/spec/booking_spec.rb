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
    it 'confirms availability of the place' do
      place = Place.create(title: 'title', description: "desc", address: "123 Street", price: 89)
      booking = Booking.create(check_in: '2018-01-04', check_out: '2018-01-07', place_id: 1)
      expect(place.available?('2018-01-04')).to be(false)
    end
  end
end
