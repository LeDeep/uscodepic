require 'spec_helper'

feature Subject do
  scenario 'add subject' do
    create_user_and_sign_in
    visit "/subjects/new"
    fill_in 'Name', :with => 'HTML/CSS'
    click_button "Add"
    page.should have_content 'created'

  end

  scenario 'invalid input' do 
    create_user_and_sign_in
    visit "/subjects/new"
    fill_in 'Name', :with => ''
    click_button "Add"
    page.should have_content "Name can't be blank"
  end

  scenario 'delete subject' 
    # create_user_and_sign_in
    # visit "/subjects/new"
    # fill_in 'Name', :with => 'HTML/CSS'
    # click_button "Add"
    # page.should have_content 'created'
    # click_link "Delete"
    # page.should have_content "Are you sure?"
    
end