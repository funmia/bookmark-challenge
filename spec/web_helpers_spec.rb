def sign_up
  visit('/users/new')
  fill_in('email', with: 'bob@gmail.com')
  fill_in('password', with: 'pizza')
  click_button 'Sign up'
end
