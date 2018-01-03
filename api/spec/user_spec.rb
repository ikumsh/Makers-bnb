describe User do
  let!(:user) do
    User.create(email: 'example@example.com', password: '12345', password_confirmation: 'password')
  end

  it 'authenticates when given valid login details' do
    expect(user.authenticate('12345')).to eq true
  end

  it 'doesn\'t authenticate when given invalid login details' do
    expect(user.authenticate('54321')).to eq false
  end
end
