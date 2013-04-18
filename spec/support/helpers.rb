def create_user_and_sign_in
  visit new_user_registration_path
  fill_in 'Email', :with => 'tester@testing.com'
  fill_in 'Password', :with => 'password'
  fill_in 'Password confirmation', :with => 'password'
  click_button 'Sign up'
end

def create_subject_and_type
    visit "/subjects/new"
    fill_in 'Name', :with => 'Rails'
    click_button "Add"
    visit new_type_path
    fill_in 'Name', :with => 'Tutorial'
    click_button "Add"
end


