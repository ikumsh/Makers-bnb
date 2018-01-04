describe Booking do
  let(:booking) { Booking.create(check_in: '2018-01-04', check_out: '2018-01-07')}
  it 'returns the check in date' do
    expect(booking.check_in).to be_kind_of(Date)
  end

  it 'returns the check out date' do
    expect(booking.check_out).to be_kind_of(Date)
  end
end
