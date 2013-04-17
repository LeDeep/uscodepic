require 'spec_helper'

feature 'help requests:' do
  scenario 'as a user, i want to create a help request' do
    create_user_and_sign_in
    visit new_help_request_path
    fill_in 'Subject', :with => 'need help!'
    fill_in 'Details', :with => 'cannot figure this out. boo :('
    click_button 'Submit'
    page.should have_content 'Help request opened.'
  end

  scenario 'as a user, i want to see an error if i submit an invalid help request' do
    create_user_and_sign_in
    visit new_help_request_path
    fill_in 'Subject', :with => ''
    fill_in 'Details', :with => ''
    click_button 'Submit'
    page.should have_content 'problem'
  end

  scenario 'as a visitor or user, i want to see a list of all help requests' do
    help_request = FactoryGirl.create :help_request
    visit help_requests_path
    page.should have_content help_request.subject
  end

  scenario 'as a visitor or a user, i want to view an individual help request' do
    help_request = FactoryGirl.create :help_request
    visit help_requests_path
    click_link help_request.subject
    page.should have_content help_request.details
  end

  scenario 'as a visitor, i should not be able to create a help request' do
    visit new_help_request_path
    page.should have_content 'Please sign in or create an account'
  end
end
