describe Place do


  it 'returns the title of a listing' do
    user = User.create(email: 'example@example.com', name: 'someone', password: '12345', password_confirmation: '12345')
    place = Place.create(title: 'title', description: "desc", address: "123 Street", price: 89, user: user)
    expect(place.title).to eq('title')
  end
end
