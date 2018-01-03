require_relative '../../app/app.rb'

feature 'User can create a new space' do
  scenario "'List This Property!' button works" do
    visit('/newlisting')
    fill_in 'title', with: 'Flat'
    fill_in 'description', with: 'bathtub'
    fill_in 'address', with: '123 Street'
    fill_in 'price', with: 1
    click_button 'List This Property!'

    expect(current_path).to eq('/places')

    within 'ul#places' do
      expect(page).to have_content('Flat')
    end
  end
end
