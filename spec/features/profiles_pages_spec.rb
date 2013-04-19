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

  scenario "a logged in user's profile shows all their skills" do
    skill = FactoryGirl.create(:skill)
    user = FactoryGirl.create(:user, :skills => [skill])
    create_user_and_sign_in(user)
    visit profile_path
    page.should have_content skill.name
  end
end
