feature 'Validates email address' do
  scenario 'does not accept empty email field' do
    expect{ empty_email }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'does not accept an invalid email format' do
    expect{ invalid_email }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'prevents duplicate registrations' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content ('This email already exists')
  end
end
