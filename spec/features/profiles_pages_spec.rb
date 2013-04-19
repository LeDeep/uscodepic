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

  scenario "help requests that a user has created are shown on their profile" do
    create_user_and_sign_in
    visit new_help_request_path 
    fill_in 'Subject', :with => 'integration testing'
    fill_in 'Details', :with => 'when is it too much?'
    click_on 'Submit'
    visit profile_path
    page.should have_content 'integration testing'
  end

  scenario "a user's responses to another user's help requests is shown as an activity on their profile" do
    response = FactoryGirl.create(:response)
    requester = response.help_request.user
    responder = response.user 
    create_user_and_sign_in(responder)
    visit profile_path
    page.should have_content "#{responder.name} responded to #{requester.name}'s"
  end

  scenario "skill additions are shown as an activity on their profile " do
    skill = FactoryGirl.create(:skill)
    user = FactoryGirl.create(:user, :skills => [skill])
    create_user_and_sign_in(user)   
    visit profile_path
    page.should have_content "#{user.name} added '#{skill.name}' as a skill to their profile"
  end


end
