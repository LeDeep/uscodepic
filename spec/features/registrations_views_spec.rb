require 'spec_helper'

feature 'registration' do
  scenario 'sign up' do
    visit new_user_registration_path
    fill_in 'Email', :with => 'tester@testing.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Sign up'
    page.should have_content 'tester@testing.com'
  end
end