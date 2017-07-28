def sign_up
  visit('/users/new')
  fill_in('email', with: 'bob@gmail.com')
  fill_in('password', with: 'pizza')
  fill_in('password_confirmation', with: 'pizza')
  click_button 'Sign up'
end


def sign_up_mismatch
  visit('/users/new')
  fill_in('email', with: 'bob@gmail.com')
  fill_in('password', with: 'pizza')
  fill_in('password_confirmation', with: 'rice')
  click_button 'Sign up'
end
