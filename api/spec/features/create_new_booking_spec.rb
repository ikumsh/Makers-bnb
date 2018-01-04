feature 'bookings' do
  scenario 'user can be directed to booking page' do
    sign_up
    place = Place.create(title: 'Flat', description: 'bathtub', address: '123 Street', price: 1)
    visit '/places'
    click_on 'Flat'
    click_button 'Book'
    expect(current_path).to eq('/bookings/new')
  end

  scenario 'user can fill out form to book a place' do
    sign_up
    place = Place.create(title: 'Flat', description: 'bathtub', address: '123 Street', price: 1)
    visit '/places'
    click_on 'Flat'
    click_button 'Book'
    expect(page).to have_content('Select dates:')
  end
end
