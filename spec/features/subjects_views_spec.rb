require 'spec_helper'

feature Subject do
  scenario 'add subject' do
    create_user_and_sign_in
    visit new_subject_path
    fill_in 'Category', :with => 'HTML/CSS'
    click_button "Add"
    page.should have_content 'created'

  end

  scenario 'invalid input' do 
    create_user_and_sign_in
    visit new_subject_path
    fill_in 'Category', :with => ''
    click_button "Add"
    page.should have_content "Category can't be blank"
  end

  scenario 'show tools by subject' do
    create_user_and_sign_in
    create_subject_and_type
    visit subjects_path
    click_on "Rails"
    page.should have_content 'Subject: Rails'
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