def create_user_and_sign_in(user=FactoryGirl.create(:user))
  visit new_user_session_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
end

def create_subject_and_type
    visit "/subjects/new"
    fill_in 'Category', :with => 'Rails'
    click_button "Add"
    visit new_type_path
    fill_in 'Format', :with => 'Tutorial'
    click_button "Add"
end

def create_word_sample
  visit new_word_path
  fill_in 'word_term', :with => 'sample'
  click_button 'Submit'
end

def create_word_with_definition #fixme
  create_word_sample
  fill_in 'definition_text', :with => 'Test definition'
  click_button 'Submit'
end
