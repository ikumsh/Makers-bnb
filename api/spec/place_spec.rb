describe Place do
  it 'returns the title of a listing' do
    place = Place.create(title: 'title', description: "desc", address: "123 Street", price: 89)
    expect(place.title).to eq('title')
  end
end
