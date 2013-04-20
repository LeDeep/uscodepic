require 'spec_helper'

feature 'goal' do
  scenario 'add goal' do
    create_user_and_sign_in
    create_subject_and_type
    create_a_tool
    visit tools_path
    click_on "Add to Study Hall"
    page.should have_content "Goal Added!"
  end
end