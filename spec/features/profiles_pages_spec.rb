require 'spec_helper'

feature 'Edit Profile' do
  scenario 'a logged in user edits a profile' do
    create_user_and_sign_in
    click_link "My account"
    click_link "Edit profile"
    fill_in "profile_first_name", :with => 'Editor'
    fill_in "profile_last_name", :with => 'McEditorson'
    fill_in "profile_email", :with => 'lotsof@editing.com'
    fill_in "profile_bio", :with => 'I edit things.'
    click_button 'Update Profile'
    page.should have_content 'McEditorson'
  end
end
