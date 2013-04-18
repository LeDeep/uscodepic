require 'spec_helper'

feature 'tool' do
  scenario 'add tool' do
    create_user_and_sign_in
    visit new_tool_path
    fill_in 'Name', :with => 'Agile Development'
    fill_in 'Location', :with => 'http://rubypond.com/blog/quickstart-guide-to-agile'
    fill_in 'Level', :with => '1'
    fill_in 'Cost', :with => 'Free'
    click_on 'Add'
    page.should have_content "Tool Added!"
  end

  scenario 'add tool' do
    create_user_and_sign_in
    visit new_tool_path
    fill_in 'Name', :with => ''
    fill_in 'Location', :with => 'http://rubypond.com/blog/quickstart-guide-to-agile'
    fill_in 'Level', :with => '1'
    fill_in 'Cost', :with => 'Free'
    click_on 'Add'
    page.should have_content "correct these problems"
  end

end