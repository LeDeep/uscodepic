require 'spec_helper'

feature 'new definition' do
  scenario 'with signed in user' do
    create_user_and_sign_in
    FactoryGirl.create(:word)
    visit words_path
    click_link "Add a definition"
    fill_in 'definition_text', :with => 'This is a sample definition'
    click_button 'Submit'
    page.should have_content "This is a sample definition"
  end
end
