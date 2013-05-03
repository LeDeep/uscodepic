require 'spec_helper'

feature 'type' do
  scenario 'add type' do
    create_user_and_sign_in
    visit "/types/new"
    fill_in 'Format', :with => 'Book'
    click_button "Add"
    page.should have_content 'created'


  end

  scenario 'invalid input' do 
    create_user_and_sign_in
    visit "/types/new"
    fill_in 'Format', :with => ''
    click_button "Add"
    page.should have_content "Format can't be blank"
  end

  scenario 'delete type' 
    # create_user_and_sign_in
    # visit "/types/new"
    # fill_in 'Name', :with => 'Book'
    # click_button "Add"
    # page.should have_content 'created'
    # click_link "Delete"
    # page.should have_content "Are you sure?"

end