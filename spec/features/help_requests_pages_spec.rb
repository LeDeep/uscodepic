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
    page.should have_content help_request.user.email
    page.should have_content help_request.created_at.localtime.strftime("on %x at %I:%M %p")
  end

  scenario 'as a visitor/user, i wanna see responses for a help request' do
    response = FactoryGirl.create :response
    visit help_request_path(response.help_request)
    page.should have_content response.message
  end

  scenario 'as a visitor, i should not be able to create a help request' do
    visit new_help_request_path
    page.should have_content 'Please sign in or create an account'
  end

  scenario 'as a user i want to be able to respond to a help request' do
    help_request = FactoryGirl.create :help_request
    create_user_and_sign_in
    visit help_request_path(help_request)
    click_link 'Respond'
    fill_in 'Message', :with => 'help is on the way!'
    click_button 'Submit'
    page.should have_content 'response was posted'
  end

  scenario 'as a visitor i should not be able to respond' do
    help_request = FactoryGirl.create :help_request
    visit help_request_path(help_request)
    page.should_not have_content 'Respond'
  end

  scenario 'as a user, i want to see an error if i submit an invalid response' do
    help_request = FactoryGirl.create :help_request
    create_user_and_sign_in
    visit help_request_path(help_request)
    click_link 'Respond'
    fill_in 'Message', :with => ''
    click_button 'Submit'
    page.should have_content 'problems'
  end

  scenario 'as a user, i want to be able to close a request' do
    help_request = FactoryGirl.create :help_request
    visit new_user_session_path
    fill_in 'Email', :with => help_request.user.email
    fill_in 'Password', :with => help_request.user.password
    click_button 'Sign in'
    visit help_request_path(help_request)
    click_link 'Close'
    page.should have_content 'request was closed'
  end
end
