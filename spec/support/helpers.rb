def create_user_and_sign_in(user=FactoryGirl.create(:user))
  visit new_user_session_path
  fill_in 'Email', :with => user.email
  fill_in 'Password', :with => user.password
  click_button 'Sign in'
end

def create_subject_and_type
    visit "/subjects/new"
    fill_in 'Name', :with => 'Rails'
    click_button "Add"
    visit new_type_path
    fill_in 'Name', :with => 'Tutorial'
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

def create_a_tool
  visit new_tool_path
  fill_in 'Name', :with => 'Fortran for Fun'
  fill_in 'Location', :with => 'http://guides.rubyonrails.org/migrations.html'
  select('Rails', :from => 'tool_subject_id')
  select('Tutorial', :from => 'tool_type_id')
  select('Beginner', :from => 'tool_level')
  select('Free', :from => 'tool_cost')
  click_on 'Save'
end
