require 'spec_helper'

feature 'Create Skill' do
  scenario 'as a user, i want to be able to say i have a pre-existing skill' do
    skill = FactoryGirl.create :skill
    create_user_and_sign_in
    visit profile_path
    click_link 'Add a skill'
    click_link skill.name
    page.should have_content 'Skill added to your profile.'
  end

  scenario 'as a user, I want to be able to add a new skill' do
    create_user_and_sign_in
    visit profile_path
    click_link 'Add a skill'
    click_link 'Create new skill'
    fill_in 'Skill', :with => 'github merging'
    click_button 'Submit'
    page.should have_content 'Skill added.'
  end

  scenario "a logged in user deletes one of their skills" do
    create_user_and_sign_in(FactoryGirl.create(:user_with_skill))
    visit profile_path
    click_link 'x'
    page.should have_content 'Skill removed.'
  end  
end
