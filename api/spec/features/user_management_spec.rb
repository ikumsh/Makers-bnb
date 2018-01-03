feature 'signing in' do

  def sign_up(email: 'example@example.com', name: 'someone', password: '12345', password_confirmation: '12345')
    visit '/users/new'
    fill_in(:email, with: email)
    fill_in(:name, with: name)
    fill_in(:password, with: password)
    fill_in(:password_confirmation, with: password_confirmation)
    click_button('Sign Up')
  end

  scenario 'has a sign up form with fields for email, name, and password' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_current_path('/places')
    expect(User.first.email).to eq 'example@example.com'
  end
end

# scenario 'doesnt create a new user if password confirmation fails' do
#     expect {sign_up(password_confirmation: 'notcorrect')}.to change(User, :count).by(0)
#     expect(page).to have_current_path('/users')
#     expect(page).to have_content "Password does not match the confirmation"
#   end
#
#   scenario 'user cannot sign up with a blank email address' do
#     expect {sign_up(email: nil)}.to change(User, :count).by(0)
#     expect(page).to have_current_path('/users')
#     expect(page).to have_content "Email must not be blank"
#   end
#
#   scenario 'user cannot sign up with an invalid email address' do
#     expect {sign_up(email: 'abcdef')}.to change(User, :count).by(0)
#     expect(page).to have_current_path('/users')
#     expect(page).to have_content "Email has an invalid format"
#   end
#
#   scenario 'user cannot sign up with an already registered email address' do
#     sign_up
#     expect { sign_up }.to change(User, :count).by(0)
#     expect(page).to have_content "Email is already taken"
#   end
#
  scenario 'new users have the option to sign up' do
    visit '/'
    click_button('Sign Up')
    expect(page).to have_current_path('/users/new')
  end
end
