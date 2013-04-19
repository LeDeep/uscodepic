require 'spec_helper'

feature 'Edit Profile' do
  scenario "a logged in user's profile shows all their skills" do
    skill = FactoryGirl.create(:skill)
    user = FactoryGirl.create(:user, :skills => [skill])
    create_user_and_sign_in(user)
    visit profile_path
    page.should have_content skill.name
  end

  scenario 'a logged in user edits a profile through navbar link' do
    create_user_and_sign_in
    click_on "MyCodeEpic"
    click_on "Edit profile"
    fill_in "profile_first_name", :with => 'Editor'
    fill_in "profile_last_name", :with => 'McEditorson'
    fill_in "profile_email", :with => 'lotsof@editing.com'
    fill_in "profile_bio", :with => 'I edit things.'
    click_button 'Update Profile'
    page.should have_content 'McEditorson'
  end

  scenario "user can get to profile view through navbar link" do
    user = FactoryGirl.create(:user)
    create_user_and_sign_in(user)
    click_on 'MyCodeEpic'
    click_on 'View profile'
    page.should have_content "#{user.name}'s Profile"
  end

  scenario "user can get to edit account view through navbar link" do
    user = FactoryGirl.create(:user)
    create_user_and_sign_in(user)
    click_on 'MyCodeEpic'
    click_on 'Edit account'
    fill_in 'Email', :with => 'edit@account.me'
    fill_in 'Current password', :with => user.password
    click_on 'Update'
    user.reload.email.should eq 'edit@account.me'
  end

  scenario "user can get to Log Out through the navbar link" do
    create_user_and_sign_in
    click_on 'MyCodeEpic'
    click_on 'Log out'
    page.should have_content 'Signed out successfully.'
  end
end
