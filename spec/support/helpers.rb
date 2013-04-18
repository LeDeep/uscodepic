def create_user_and_sign_in
  visit new_user_registration_path
  fill_in 'Email', :with => 'tester@testing.com'
  fill_in 'Password', :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
  click_button 'Sign up'
end

def create_word_sample
  visit new_word_path
  fill_in 'word_term', :with => 'sample'
  click_button 'Submit'
end

def create_word_with_definition
  create_word_sample
  fill_in 'definition_text', :with => 'Test definition'
  click_button 'Submit'
end
