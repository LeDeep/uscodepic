require 'spec_helper'

feature 'tool' do
  scenario 'add tool' do
    create_user_and_sign_in
    create_subject_and_type
    visit new_tool_path
    fill_in 'Name', :with => 'Agile Development'
    fill_in 'Location', :with => 'http://rubypond.com/blog/quickstart-guide-to-agile'
    select('Rails', :from => 'tool_subject_id')
    select('Tutorial', :from => 'tool_type_id')
    select('Beginner', :from => 'tool_level')
    fill_in 'Cost', :with => 'Free'
    click_on 'Save'
    page.should have_content "Tool Added!"
  end

  scenario 'invalid entry' do
    create_user_and_sign_in
    create_subject_and_type
    visit new_tool_path
    fill_in 'Name', :with => ''
    fill_in 'Location', :with => 'http://rubypond.com/blog/quickstart-guide-to-agile'
    select('Rails', :from => 'tool_subject_id')
    select('Tutorial', :from => 'tool_type_id')
    select('Beginner', :from => 'tool_level')
    fill_in 'Cost', :with => 'Free'
    click_on 'Save'
    page.should have_content "correct these problems"
  end


end