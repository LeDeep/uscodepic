require 'spec_helper'

feature 'tool' do
  scenario 'add tool' do
    create_user_and_sign_in
    visit "/tools/new"
    fill_in 'Name', :with => 'Agile Development'
    fill_in 'Location', :with => 'http://rubypond.com/blog/quickstart-guide-to-agile'
    fill_in 'Level', :with => '1'
    fill_in 'Cost', :with => 'Free'
    fill_in 'Subject', :with => subject_id
    fill_in 'Type', :with => type_id
  end
end