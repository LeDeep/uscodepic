def create_user_and_sign_in
  visit new_user_registration_path
  fill_in 'Email', :with => 'tester@testing.com'
  fill_in 'Password', :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
  click_button 'Sign up'
end
