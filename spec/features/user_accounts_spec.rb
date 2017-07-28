feature 'User sign up' do
  scenario 'I can register a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path('/links')
    expect(page).to have_content "Welcome bob@gmail.com"
    expect(User.first.email).to eq "bob@gmail.com"
  end
end
