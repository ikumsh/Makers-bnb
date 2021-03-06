require_relative '../../app/app.rb'

feature 'User can view list of all the places' do
  scenario 'Create new listing button works' do
    visit('/places')
    sign_up
    expect(page).to have_button('Create new listing')
  end

  scenario 'Show the list of properties' do
    place = Place.create(title: 'Flat', description: 'bathtub', address: '123 Street', price: 1, user_id: 1)
    visit('/places')

    within 'ul#places' do
      expect(page).to(have_content('Flat')) && have_content('bathtub') && have_content('123 Street') && have_content(1)
    end
  end
end

feature 'individual pages for each place' do
  scenario 'user can click on a place and view it in another page' do
    place = Place.create(title: 'Flat', description: 'bathtub', address: '123 Street', price: 1, user_id: 1)
    visit '/places'
    click_on 'Flat'
    expect(page).to have_current_path("/places/#{place.id}")
    expect(page).to(have_content('Flat')) && have_content('bathtub') && have_content('123 Street') && have_content(1)
  end
end
