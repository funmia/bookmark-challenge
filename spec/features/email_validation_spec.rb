feature 'Validates email address' do
  scenario 'does not accept empty email field' do
    expect{ empty_email }.not_to change(User, :count)
  end

  scenario 'does not accept an invalid email format' do
    expect{ invalid_email }.not_to change(User, :count)
  end
end
