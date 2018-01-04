feature 'signing up' do

  scenario 'has a sign up form with fields for email, name, and password' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_current_path('/places')
    expect(User.first.email).to eq 'example@example.com'
  end

  scenario 'doesnt create a new user if password confirmation fails' do
    expect {sign_up(password_confirmation: 'notcorrect')}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'user cannot sign up with a blank email address' do
    expect {sign_up(email: nil)}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect {sign_up(email: 'abcdef')}.to change(User, :count).by(0)
    expect(page).to have_current_path('/users')
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'user cannot sign up with an already registered email address' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content "Email is already taken"
  end

  scenario 'new users have the option to sign up' do
    visit '/'
    click_button('Sign Up')
    expect(page).to have_current_path('/users/new')
  end
end

feature 'Sign in' do
  let!(:user) do
    User.create(email: 'example@coldmail.com', name: 'George', username: 'Chunks', password: 'password', password_confirmation: 'password')
  end
  scenario 'user can sign in with the correct information' do
    sign_in
    expect(page).to have_content 'Welcome, George'
  end
  scenario 'user cannot sign in with incorrect information' do
    sign_in(password: 'wrong')
    expect(page).not_to have_content 'Welcome, George'
  end
end


feature 'sign out' do

  before(:each) do
    User.create(email: 'example@coldmail.com', name: 'George', password: 'password', password_confirmation: 'password')
  end
  scenario 'sign in and out' do
    sign_up
    click_button 'Sign out'
    expect(page).to have_content('You have logged out successfully')
    expect(page).not_to have_content('Welcome, George')
  end

end
